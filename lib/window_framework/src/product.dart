import 'dart:async';

import 'package:meta/meta.dart';
import 'package:react/react_client.dart';
import 'package:over_react/over_react.dart';
import 'package:uuid/uuid.dart';
import 'package:w_common/disposable.dart';
import 'package:w_module/w_module.dart';

typedef String TitleFactory();
typedef ReactElement ContentFactory();

/// A [Product] is a standalone piece of the Lectern functionality
class Product extends Disposable {
  static Uuid _uuid = new Uuid();

  TitleFactory _titleFactory;
  ContentFactory _contentFactory;

  Product(
    Module this._module, {
    ContentFactory contentFactory,
    int this.sortOrder: 0,
    TitleFactory titleFactory,
  })
      : _contentFactory = contentFactory,
        _titleFactory = titleFactory,
        runtimeId = _uuid.v4() {
    didDispose.then((_) {
      _module = null;
    });
  }

  Module _module;

  final String runtimeId;

  int sortOrder;

  Future<Null> load() => _module.load();
  Future<Null> unload() => _module.unload();

  String get title {
    if (_titleFactory == null) {
      return null;
    }
    return _titleFactory();
  }

  ReactElement get content {
    if (_contentFactory == null) {
      return null;
    }
    return _contentFactory();
  }
}
