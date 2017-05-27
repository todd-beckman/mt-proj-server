import 'dart:html';

import 'package:mtproj/mt_skin/flexbox.dart';
import 'package:mtproj/mt_skin/mt_skin.dart';
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
      text,
      buttons,
    );

react_client.ReactElement get text {
  int key = 0;
  var rows = <react_client.ReactElement>[];
  TextColor.values.forEach((TextColor color) {
    var cols = <react_client.ReactElement>[];
    BgColor.values.forEach((BgColor bgcolor) {
      cols.add(
        (Dom.td()
          ..key = '${key++}'
          ..className = '${color.className} ${bgcolor.className}')('Content'),
      );
    });
    rows.add(
      (Dom.tr()..key = '${key++}')(
        cols,
      ),
    );
  });

  return Block()(
    Dom.h1()('Color Scheme'),
    Dom.table()(rows),
  );
}

react_client.ReactElement get buttons => Block()(
      Dom.h1()('Button Skins'),
      (Button()..skin = ButtonSkin.Primary)('Primary'),
      (Button()..skin = ButtonSkin.Alternate)('Alternate'),
      (Button()..skin = ButtonSkin.Success)('Success'),
      (Button()..skin = ButtonSkin.Warn)('Warn'),
      (Button()..skin = ButtonSkin.Danger)('Danger'),
      (Button()..skin = ButtonSkin.Gray)('Gray'),
    );
