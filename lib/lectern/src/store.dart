import 'dart:async';

import 'package:meta/meta.dart' show required;
import 'package:react/react_client.dart';
import 'package:w_module/w_module.dart';
import 'package:w_flux/w_flux.dart';

import 'package:mtproj/core/core.dart';
import 'package:mtproj/editor/editor.dart';
import 'package:mtproj/file_tree/file_tree.dart';

import 'api.dart';
import 'events.dart';

class LecternStore extends Store {
  LecternActions _actions;
  DispatchKey _dispatchKey;
  LecternEvents _events;

  final AppContext appContext;

  LecternStore({
    @required LecternActions actions,
    @required AppContext this.appContext,
    @required DispatchKey dispatchKey,
    @required LecternEvents events,
  })
      : _actions = actions,
        _dispatchKey = dispatchKey,
        _events = events {
    didDispose.then((_) {
      _actions = null;
      _events = null;
    });
  }

  Future<Null> load() async {
    print('loaded');
  }
}
