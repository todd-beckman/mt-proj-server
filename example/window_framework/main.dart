import 'dart:html';

import 'package:mtproj/window_framework/window_framework.dart';
import 'package:mtproj/window_framework/window_framework_mock.dart';
import 'package:mtproj/core/core_mock.dart';
import 'package:react/react_dom.dart' as react_dom;
import 'package:react/react_client.dart' as react_client;

main() {
  react_client.setClientConfiguration();

  // configures logging
  new MockAppContext();

  var windowManager = new MockWindowManager();
    // test what it's like when a region is missing
    //..setRegionInactive(RegionLocation.Right);

  react_dom.render(windowManager.content(), querySelector('#body'));
}
