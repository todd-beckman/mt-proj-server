import 'dart:async';

import 'package:logging/logging.dart';
import 'package:mtproj/mt_api.dart' as api;
import 'package:w_common/disposable.dart';

import 'package:mtproj/core/core.dart' show Messenger;

import 'mt_file.dart';

Logger _log = new Logger('mtproj.proj');

/// Read-only information that is known for a Project.
///
/// Writes should be made separately. Ideally backed by built-values
class MtProject extends Disposable {
  MtProject(api.Project this._project, Messenger this._messenger) {
    didDispose.then((_) {
      _fileMap = null;
      _messenger = null;
      _project = null;
      _rootId = null;
    });
  }

  Messenger _messenger;

  api.Project _project;

  /// This project's unique identifier
  String get id => _project.id;

  /// The user-facing name of this project
  String get displayName => _project.displayName;

  /// Whether this project has loaded all of its required data
  bool get isLoaded => _isLoaded;
  bool _isLoaded = false;

  /// Fetches the root node of the project
  MtFile get rootFile => _fileMap[_rootId];
  String _rootId;

  /// Gives the [MtFile] with the given id
  MtFile operator[](String fileId) => _fileMap[fileId];
  Map<String, MtFile> _fileMap = {};

  Future loadFileTree() async {
    api.FileMeta root;
    try {
      root = await _messenger.getFileTree(id);
    } catch (e) {
      _log.severe(e);
      throw e;
    }

    if (root == null || root.id == null) {
      var e = new Exception('Null root after fetching file tree');
      _log.severe(e);
      throw e;
    }

    _rootId = root.id;
    _addFileToMap(root);
    _isLoaded = true;
  }

  void _addFileToMap(api.FileMeta node) {
    if (_fileMap[node.id] != null) {
      _log.warning('Warning: duplicate tree node ${node.id} found');
    }
    _fileMap[node.id] = new MtFile(node, _messenger);

    node.children?.forEach((api.FileMeta file) {
      _fileMap[node.id].children.add(file.id);
      _addFileToMap(file);
    });
  }

  String toString() {
    var buffer = new StringBuffer('$displayName\n');

    _writeFileToBuffer(buffer, rootFile);

    return buffer.toString();
  }

  void _writeFileToBuffer(StringBuffer buffer, MtFile file, {depth: 0}) {
    buffer.write((' ' * depth) + 'id ${file.id} name ${file.displayName}\n');
    file.children?.forEach((String fileId) {
      _writeFileToBuffer(buffer, _fileMap[fileId], depth: depth + 1);
    });
  }
}
