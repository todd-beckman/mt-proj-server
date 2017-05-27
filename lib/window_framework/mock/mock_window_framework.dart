import 'package:mtproj/window_framework/window_framework.dart';
import 'package:w_module/w_module.dart';
import 'package:over_react/over_react.dart';

class MockWindowManager extends WindowManager {
  SampleModule module;

  MockWindowManager({
    Content head,
    Content left,
    Content body,
    Content right,
  }) {
    module = new SampleModule();

    if (head == null) {
      addDummyContent(RegionLocation.HEAD);
    } else {
      addContent(head, RegionLocation.HEAD);
    }

    if (left == null) {
      addDummyContent(RegionLocation.LEFT);
    } else {
      addContent(left, RegionLocation.LEFT);
    }

    if (body == null) {
      addDummyContent(RegionLocation.BODY);
    } else {
      addContent(body, RegionLocation.BODY);
    }

    if (right == null) {
      addDummyContent(RegionLocation.RIGHT);
    } else {
      addContent(right, RegionLocation.RIGHT);
    }
  }

  void addDummyContent(RegionLocation location, {int sortOrder: 0}) {
    addContent(new Content(module, sortOrder: sortOrder), location);
  }
}

class SampleModule extends Module {
  DispatchKey _dispatchKey = new DispatchKey('sample');

  @override
  SampleEvents events;

  @override
  SampleComponents components;

  SampleModule() {
    events = new SampleEvents(_dispatchKey);
    components = new SampleComponents();
  }
}

class SampleEvents extends EventsCollection {
  SampleEvents(DispatchKey dispatchKey) : super(dispatchKey);
}

class SampleComponents extends ModuleComponents {
  var phrase =
      'The big black bug bit the big black bear and the big black bear bled blood. ';
  @override
  ReactElement content() => (Dom.div()..key = 'content')(
        Dom.p()(
          phrase * 30,
        ),
      );
}
