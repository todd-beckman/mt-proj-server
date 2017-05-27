import 'dart:async';

import 'package:mtproj/mt_api.dart' as api;
import 'package:w_common/disposable.dart';

import 'package:mtproj/core/core.dart' show Messenger;

/// Information that is known for a Project
class MTFile extends Disposable {
  MTFile(api.FileMeta this._fileMeta, Messenger this._messenger) {
    didDispose.then((_) {
      _content = null;
      _fileMeta = null;
      _messenger = null;
    });
  }

  Messenger _messenger;

  api.FileMeta _fileMeta;

  /// This project's unique identifier
  String get id => _fileMeta.id;

  /// The user-facing name of this project
  String get displayName => _fileMeta.name;

  /// Whether this project has loaded all of its required data
  bool get isLoaded => _isLoaded;
  bool _isLoaded = false;

  /// The contents of the file
  /// TODO: this will need to be a tree later; String just for spiking
  String get content => _content;
  String _content;

  Future loadContent() async {
    try {
      _content = await _messenger.getFileContent(id);
    } catch (e) {
      print(e);
      return;
    }

    _isLoaded = true;
  }
}
