import 'dart:async';

import 'package:meta/meta.dart' show required;
import 'package:w_flux/w_flux.dart';
import 'package:w_module/w_module.dart';

import 'package:mtproj/core/core.dart';

import 'api.dart';
import 'events.dart';

class EditorStore extends Store {
  EditorActions _actions;
  DispatchKey _dispatchKey;
  EditorEvents _events;

  final AppContext appContext;

  bool get isLoaded => _isLoaded;
  bool _isLoaded;

  Map<String, String> get docs => _docs;
  Map<String, String> _docs;

  EditorStore({
    @required EditorActions actions,
    @required AppContext this.appContext,
    @required DispatchKey dispatchKey,
    @required EditorEvents events,
  })
      : _actions = actions,
        _dispatchKey = dispatchKey,
        _events = events {
    didDispose.then((_) {
      _actions = null;
      _events = null;
      _docs = null;
    });
  }

  Future load() async {
    _refresh();

    /*
    [
      _actions.loadDocument.listen(_fetchDataForDocument),
      _actions.saveDocument.listen(_sendDocument),
    ].forEach(manageActionSubscription);
    */

    _isLoaded = true;
  }

  void _refresh() {
    _isLoaded = false;
    _docs = {};
  }
}
