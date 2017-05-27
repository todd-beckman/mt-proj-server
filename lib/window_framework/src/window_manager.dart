import 'package:w_common/disposable.dart';
import 'package:react/react_client.dart';

import 'content.dart';
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

  void addContent(Content content, RegionLocation location) {
    switch (location) {
      case RegionLocation.HEAD:
        _headManager.addContent(content);
        _headManager.setActiveContent(content.runtimeId);
        break;
      case RegionLocation.LEFT:
        _leftManager.addContent(content);
        break;
      case RegionLocation.BODY:
        _bodyManager.addContent(content);
        _bodyManager.setActiveContent(content.runtimeId);
        break;
      case RegionLocation.RIGHT:
        _rightManager.addContent(content);
        break;
    }
  }

  ReactElement content() => (WindowTemplate()
    ..head = _headManager
    ..left = _leftManager
    ..body = _bodyManager
    ..right = _rightManager)();
}
