import 'dart:async';

import 'package:meta/meta.dart' show required;
import 'package:w_module/w_module.dart';

import 'package:mtproj/common_ui/mt_skin.dart';
import 'package:mtproj/core/core.dart';

import 'api.dart';
import 'events.dart';
import 'store.dart';
import 'components/editor_content.dart';

/// This [Module] is responsible for the document editor.
class EditorModule extends Module {
  DispatchKey _dispatchKey = new DispatchKey('home module');

  EditorActions _actions;

  EditorApi get api => _api;
  EditorApi _api;

  EditorComponents get components => _components;
  EditorComponents _components;

  EditorEvents get events => _events;
  EditorEvents _events;

  EditorStore _store;

  EditorModule({
    @required AppContext appContext,
  }) {
    _actions = new EditorActions();
    _api = new EditorApi(_actions);
    _events = new EditorEvents(_dispatchKey);

    _store = new EditorStore(
      actions: _actions,
      events: _events,
      dispatchKey: _dispatchKey,
      appContext: appContext,
    );

    _components = new EditorComponents(
      actions: _actions,
      store: _store,
    );
  }

  @override
  Future<Null> load() async {
    await _store.load();
  }
}

class EditorComponents extends ModuleComponents {
  EditorActions _actions;
  EditorStore _store;

  EditorComponents({
    @required EditorActions actions,
    @required EditorStore store,
  })
      : _actions = actions,
        _store = store;

  @override
  content() => (Editor()
    ..actions = _actions
    ..color = MTColor.RED
    ..store = _store)();
}
