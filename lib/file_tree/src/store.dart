import 'dart:async';

import 'package:meta/meta.dart';
import 'package:mtproj/mt_api.dart' as api;
import 'package:w_flux/w_flux.dart';
import 'package:w_module/w_module.dart';

import 'package:mtproj/core/core.dart';

import 'api.dart';
import 'events.dart';

class FileTreeStore extends Store {
  FileTreeStore({
    @required AppContext this.appContext,
    @required FileTreeActions actions,
    @required DispatchKey dispatchKey,
    @required FileTreeEvents events,
  })
      : _actions = actions,
        _dispatchKey = dispatchKey,
        _events = events {
    didDispose.then((_) {
      _actions = null;
      _events = null;
    });

    refresh();
  }

  final AppContext appContext;
  FileTreeActions _actions;
  FileTreeEvents _events;

  DispatchKey _dispatchKey;

  /// Whether the calls from the server have returned with data that can be rendered for the user.
  bool get isLoaded => _isLoaded;
  bool _isLoaded;

  Future<Null> load() async {}

  void refresh() {
    _isLoaded = false;
  }
}
