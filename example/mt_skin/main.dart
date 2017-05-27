import 'dart:html';

import 'package:mtproj/mt_skin/flexbox.dart';
import 'package:mtproj/ui_components/ui_components.dart';
import 'package:mtproj/core/core_mock.dart';
import 'package:over_react/over_react.dart';
import 'package:react/react_dom.dart' as react_dom;
import 'package:react/react_client.dart' as react_client;

main() {
  react_client.setClientConfiguration();

  // configures logging
  new MockAppContext();

  react_dom.render(content, querySelector('#body'));
}

react_client.ReactElement get content => (Container()..vertical = true)(
      Dom.h1()('Background Colors'),
      Dom.p()('Here are some colors to test'),
      Container()(
        (Button()..skin = ButtonSkin.Primary)('Primary'),
        (Button()..skin = ButtonSkin.Alternate)('Alternate'),
        (Button()..skin = ButtonSkin.Success)('Success'),
        (Button()..skin = ButtonSkin.Warn)('Warn'),
        (Button()..skin = ButtonSkin.Danger)('Danger'),
        (Button()..skin = ButtonSkin.Gray)('Gray'),
      ),
    );
