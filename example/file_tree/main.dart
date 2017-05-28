import 'dart:html';

import 'package:react/react_dom.dart' as react_dom;
import 'package:react/react_client.dart' as react_client;

import 'package:mtproj/core/core_mock.dart';
import 'package:mtproj/file_tree/file_tree.dart';
import 'package:mtproj/window_framework/window_framework.dart';
import 'package:mtproj/window_framework/window_framework_mock.dart';

main() {
  react_client.setClientConfiguration();

  var appContext = new MockAppContext();
  var module = new FileTreeModule(
    appContext: appContext,
  );

  var content = new Product(module,
      titleFactory: module.components.title,
      contentFactory: module.components.content,
  );
  content.load(); // TODO: make this part of WindowManager lifecycle

  var windowManager = new MockWindowManager(leftProduct: content)
    ..setRegionInactive(RegionLocation.Right);

  react_dom.render(windowManager.content(), querySelector('#body'));
}
