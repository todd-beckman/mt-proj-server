import 'dart:async';

import 'dart:html';
import 'package:react/react_dom.dart' as react_dom;
import 'package:react/react_client.dart' as react_client;

import 'package:mtproj/core/core.dart';
import 'package:mtproj/mtproj.dart';

main() {
  react_client.setClientConfiguration();

  load().then((lectern) {
    react_dom.render(lectern.components.content(), querySelector('#body'));
  });
}

Future<LecternModule> load() async {
  var appContext = new AppContext(
    environment: Environment.LOCAL,
  );
  await appContext.load();

  var lectern = new LecternModule(
    appContext: appContext,
  );
  await lectern.load();
  return lectern;
}
