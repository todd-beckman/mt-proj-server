import '../src/app_context.dart';
import '../src/environment.dart';
import 'mock_messenger.dart';

class MockAppContext extends AppContext {
  MockAppContext() : super(environment: Environment.LOCAL) {
    _messenger = new MockMessenger(
      environment: environment,
      session: null,
    );
  }

  MockMessenger get messenger => _messenger;
  MockMessenger _messenger;
}
