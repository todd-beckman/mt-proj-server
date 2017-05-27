import 'dart:async';
import 'package:w_common/disposable.dart';
import 'package:w_flux/w_flux.dart';

import 'package:mtproj/core/core.dart' show log;

import 'content.dart';

/// The region to put the [Content] on the page.
///
/// [HEAD] is a full-width header.
/// [LEFT], [BODY], and [RIGHT] fill the rest of the height and divide width
/// amongs themselves.
enum RegionLocation {
  HEAD,
  LEFT,
  BODY,
  RIGHT,
}

String classNameForLocation(RegionLocation location) {
  switch (location) {
    case RegionLocation.HEAD:
      return 'reg-head';
    case RegionLocation.LEFT:
      return 'reg-left';
    case RegionLocation.BODY:
      return 'reg-body';
    case RegionLocation.RIGHT:
      return 'reg-right';
    default:
      return '';
  }
}

class RegionActions extends Disposable {
  // Removes the [Content] with the given [runtimeId]
  Action<String> removeContent = new Action<String>();

  RegionActions() {
    [
      removeContent,
    ].forEach(manageDisposable);
  }
}

class RegionManager extends Store {
  RegionManager() {
    _contentItems = [];

    _actions = new RegionActions();
    manageActionSubscription(_actions.removeContent.listen(removeContent));

    didDispose.then((_) {
      _actions = null;
      _activeIndex = null;
      _contentItems = null;
    });
  }

  RegionActions get actions => _actions;
  RegionActions _actions;

  bool get shouldRenderRegion => _activeIndex != null;
  Content get activeContent {
    if (_activeIndex == null) {
      return null;
    }
    return _contentItems[_activeIndex];
  }

  int _activeIndex;

  List<Content> get contentItems => _contentItems;
  List<Content> _contentItems;

  void setActiveContent(String runtimeId) {
    for (var i = 0; i < _contentItems.length; i++) {
      if (_contentItems[i].runtimeId == runtimeId) {
        _activeIndex = i;
        trigger();
        return;
      }
    }
    log.warning('Could not set active content: ID not found. $runtimeId');
  }

  void addContent(Content content) {
    contentItems
      ..add(content)
      ..sort((item1, item2) => item2.sortOrder - item1.sortOrder);
    trigger();
  }

  Future<Null> removeContent(String runtimeId) async {
    var content = contentItems
        .firstWhere((Content content) => content.runtimeId == runtimeId);
    if (content == null) {
      log.warning('no content $runtimeId found');
      return;
    }

    try {
      await content.unload();
    } catch (e) {
      log.warning('unloading $runtimeId erred');
    }

    _contentItems.remove(content);
    trigger();
  }
}
