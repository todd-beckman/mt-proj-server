import 'dart:async';

import 'package:mtproj/window_framework/window_framework.dart';
import 'package:mtproj/mt_skin/mt_skin.dart';
import 'package:mtproj/ui_components/ui_components.dart';
import 'package:w_module/w_module.dart';
import 'package:over_react/over_react.dart';

class MockWindowManager extends WindowManager {
  MockWindowManager({
    Product headProduct,
    Product leftProduct,
    Product bodyProduct,
    Product rightProduct,
  }) {
    if (headProduct == null) {
      var headModule = new SampleHeadModule();
      headProduct = new Product(
        headModule,
        contentFactory: headModule.components.content,
      );
    }
    addProduct(headProduct, RegionLocation.Head);
    setActiveProduct(headProduct.runtimeId, RegionLocation.Head);

    if (leftProduct == null) {
      var leftModule = new SamplePanelModule();
      leftProduct = new Product(
        leftModule,
        titleFactory: leftModule.components.title,
        contentFactory: leftModule.components.content,
      );
    }
    addProduct(leftProduct, RegionLocation.Left);
    setActiveProduct(leftProduct.runtimeId, RegionLocation.Left);

    if (bodyProduct == null) {
      var bodyModule = new SampleModule();
      bodyProduct = new Product(
        bodyModule,
        contentFactory: bodyModule.components.content,
      );
    }
    addProduct(bodyProduct, RegionLocation.Body);
    setActiveProduct(bodyProduct.runtimeId, RegionLocation.Body);

    if (rightProduct == null) {
      var rightModule = new SamplePanelModule();
      rightProduct = new Product(
        rightModule,
        contentFactory: rightModule.components.content,
        titleFactory: rightModule.components.title,
      );
    }
    addProduct(rightProduct, RegionLocation.Right);
    setActiveProduct(rightProduct.runtimeId, RegionLocation.Right);
  }
}

class SampleEvents extends EventsCollection {
  DispatchKey _dispatchKey;
  SampleEvents(DispatchKey this._dispatchKey) : super(_dispatchKey) {
    onShowHideToggled = new Event<bool>(_dispatchKey);
  }

  Event<bool> onShowHideToggled;
}

class SampleModuleApi {
  DispatchKey _dispatchKey;
  SampleEvents _events;
  SampleModuleApi(this._events, this._dispatchKey);

  toggleShowHide(bool flag) => _events.onShowHideToggled(flag, _dispatchKey);
}

class SampleModule extends Module {
  DispatchKey _dispatchKey = new DispatchKey('sample');

  @override
  SampleEvents events;

  @override
  SampleComponents components;

  SampleModule() {
    events = new SampleEvents(_dispatchKey);
    components = new SampleComponents('This title should not be rendered');
  }
}

class SampleHeadModule extends SampleModule {
  SampleHeadModule() : super() {
    components = new SampleComponents('This title should not be rendered');
  }
}

class SamplePanelModule extends SampleModule {
  SamplePanelModule() : super() {
    components = new SampleComponents('A Panel Product');
  }
}

class SampleComponents extends ModuleComponents {
  final String _title;
  SampleComponents(String this._title);

  String phrase =
      'The big black bug bit the big black bear and the big black bear bled blood. ';

  String title() => _title;

  @override
  ReactElement content() => (Dom.div()..key = 'content')(
        Dom.p()(
          phrase * 20,
        ),
      );
}
