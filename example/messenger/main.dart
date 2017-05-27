import 'dart:html';

import 'package:mtproj/window_framework/window_framework_mock.dart';
import 'package:over_react/over_react.dart';
import 'package:react/react_dom.dart' as react_dom;
import 'package:react/react_client.dart' as react_client;

import 'package:mtproj/core/core.dart';

Messenger messenger;

main() {
  react_client.setClientConfiguration();

  var appContext = new AppContext(
    environment: Environment.LOCAL,
  );
  appContext.load().then((_) =>
      appContext.messenger.isLoaded ? showMessengerClient() : showError());
  messenger = appContext.messenger;

  showLoadingState();
}

showLoadingState() {
  react_dom.render(Dom.p()('Messenger loading...'), querySelector('#body'));
}

showMessengerClient() {
  react_dom.render(
      Dom.p()('Messenger loaded successfully!'), querySelector('#body'));
}

showError() {
  react_dom.render(Dom.p()('Messenger failed'), querySelector('#body'));
}
