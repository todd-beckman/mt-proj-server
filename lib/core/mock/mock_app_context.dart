import 'package:mtproj/central_intelligence/central_intelligence.dart';

import '../src/app_context.dart';
import '../src/environment.dart';
import 'mock_messenger.dart';

class MockAppContext extends AppContext {
  MockAppContext() : super(environment: Environment.LOCAL) {
    _messenger = new MockMessenger(
      environment: environment,
      session: null,
    );
    _intel = new CentralIntelligence(_messenger);

  }

  @override
  MockMessenger get messenger => _messenger;
  MockMessenger _messenger;

  @override
  CentralIntelligence get intel => _intel;
  CentralIntelligence _intel;
}
