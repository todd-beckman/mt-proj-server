import 'dart:async';

import 'package:mtproj/mt_api.dart' as api;
import 'package:w_common/disposable.dart';

import 'package:mtproj/core/core.dart' show Messenger;

/// Information that is known for a Project
class MTProject extends Disposable {
  MTProject(api.Project this._project, Messenger this._messenger) {
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
  String get displayName => _project.name;

  /// Whether this project has loaded all of its required data
  bool get isLoaded => _isLoaded;
  bool _isLoaded = false;

  /// Fetches the root node of the project
  api.FileMeta get fileTreeRoot => fileMap[_rootId];
  String _rootId;

  /// Map providing `fileId` --> [FileMeta]
  Map<String, api.FileMeta> get fileMap => _fileMap;
  Map<String, api.FileMeta> _fileMap;

  Future loadFileTree() async {
    api.FileMeta root;
    try {
      root = await _messenger.getFileTree(id);
    } catch (e) {
      print(e);
      return;
    }

    _addFileToMap(root);
    _isLoaded = true;
  }

  void _addFileToMap(api.FileMeta node) {
    if (_fileMap[node.id] != null) {
      print('Warning: duplicate tree node ${node.id} found');
    }
    _fileMap[node.id] = node;
  }
}
