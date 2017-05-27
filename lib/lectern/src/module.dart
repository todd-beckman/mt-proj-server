import 'dart:async';

import 'package:meta/meta.dart' show required;
import 'package:react/react_client.dart';
import 'package:w_module/w_module.dart';

import 'package:mtproj/core/core.dart';
import 'api.dart';
import 'events.dart';
import 'store.dart';

import 'components/lectern_content.dart';

/// This [Module] is responsible for the ui environment.
class LecternModule extends Module {
  DispatchKey _dispatchKey = new DispatchKey('src module');

  LecternActions _actions;

  LecternApi get api => _api;
  LecternApi _api;

  LecternComponents get components => _components;
  LecternComponents _components;

  LecternEvents get events => _events;
  LecternEvents _events;

  LecternStore _store;

  LecternModule({
    @required AppContext appContext,
  }) {
    _actions = new LecternActions();
    _events = new LecternEvents(_dispatchKey);

    _store = new LecternStore(
      actions: _actions,
      events: _events,
      dispatchKey: _dispatchKey,
      appContext: appContext,
    );

    _components = new LecternComponents(
      actions: _actions,
      store: _store,
    );

    _api = new LecternApi(_actions);
  }

  @override
  Future<Null> load() async => _store.load();
}

class LecternComponents extends ModuleComponents {
  LecternActions _actions;
  LecternStore _store;

  LecternComponents({
    @required LecternActions actions,
    @required LecternStore store,
  })
      : _actions = actions,
        _store = store;

  @override
  ReactElement content() => (Lectern()
    ..actions = _actions
    ..store = _store)();
}
