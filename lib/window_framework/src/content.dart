import 'dart:async';

import 'package:meta/meta.dart';
import 'package:react/react_client.dart';
import 'package:uuid/uuid.dart';
import 'package:w_common/disposable.dart';
import 'package:w_module/w_module.dart';

/// A [Content] is either a left
class Content extends Disposable {
  static Uuid _uuid = new Uuid();

  Content(
    Module this._module, {
    int this.sortOrder: 0,
  })
      : runtimeId = _uuid.v4() {
    didDispose.then((_) {
      _module = null;
    });
  }

  Module _module;

  final String runtimeId;

  int sortOrder;

  Future<Null> load() => _module.load();
  Future<Null> unload() => _module.unload();

  ReactElement get content => _module.components.content();
}
