import 'package:w_common/disposable.dart';
import 'package:react/react_client.dart';

import 'product.dart';
import 'region_manager.dart';
import 'components/window_template.dart';

/// WindowManager is responsible for handling the global interface.
///
/// It should abstract the rendering of [Components] in a manner that should
/// ideally sandbox each one.
class WindowManager extends Disposable {
  WindowManager() {
    [
      _headManager = new RegionManager(),
      _leftManager = new RegionManager(),
      _bodyManager = new RegionManager(),
      _rightManager = new RegionManager(),
    ].forEach(manageDisposable);
  }

  RegionManager _headManager;
  RegionManager _leftManager;
  RegionManager _bodyManager;
  RegionManager _rightManager;

  void addProduct(Product content, RegionLocation location) {
    switch (location) {
      case RegionLocation.Head:
        _headManager.addProduct(content);
        break;
      case RegionLocation.Left:
        _leftManager.addProduct(content);
        break;
      case RegionLocation.Body:
        _bodyManager.addProduct(content);
        break;
      case RegionLocation.Right:
        _rightManager.addProduct(content);
        break;
    }
  }

  void setRegionInactive(RegionLocation location) {
    switch (location) {
      case RegionLocation.Head:
        _headManager.setInactive();
        break;
      case RegionLocation.Left:
        _leftManager.setInactive();
        break;
      case RegionLocation.Body:
        _bodyManager.setInactive();
        break;
      case RegionLocation.Right:
        _rightManager.setInactive();
        break;
    }
  }

  void setActiveProduct(String runtimeId, RegionLocation location) {
    switch (location) {
      case RegionLocation.Head:
        _headManager.setActiveProduct(runtimeId);
        break;
      case RegionLocation.Left:
        _leftManager.setActiveProduct(runtimeId);
        break;
      case RegionLocation.Body:
        _bodyManager.setActiveProduct(runtimeId);
        break;
      case RegionLocation.Right:
        _rightManager.setActiveProduct(runtimeId);
        break;
    }
  }

  ReactElement content() => (WindowTemplate()
    ..head = _headManager
    ..left = _leftManager
    ..body = _bodyManager
    ..right = _rightManager)();
}
