import 'dart:async';

import 'package:meta/meta.dart' show required;
import 'package:mtproj/central_intelligence/central_intelligence.dart';

import 'environment.dart';
import 'logging.dart';
import 'messenger.dart';
import 'session.dart';

class AppContext {
  AppContext({
    @required Environment this.environment,
  }) {
    _session = new Session(userId: 'some-user-id');
    _messenger = new Messenger(
      environment: environment,
      session: session,
    );
    _intel = new CentralIntelligence(_messenger);

    configureLogging(environment);
  }

  final Environment environment;

  CentralIntelligence get intel => _intel;
  CentralIntelligence _intel;

  bool _isLoaded = false;

  Messenger get messenger => _messenger;
  Messenger _messenger;

  Session get session => _session;
  Session _session;

  Future<bool> load() async {
    if (_isLoaded) {
      print('Context already loaded!');
      return true;
    }

    if (!await _messenger.load()) {
      return false;
    }

    await _intel.loadProjectMeta('');

    _isLoaded = true;
    return true;
  }
}
