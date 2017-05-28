import 'dart:async';

import 'package:logging/logging.dart';
import 'package:mtproj/mt_skin/mt_skin.dart';
import 'package:w_common/disposable.dart';
import 'package:w_flux/w_flux.dart';

import 'product.dart';

Logger _log = new Logger('mtproj.region');

/// The region to put the [Product] on the page.
///
/// [Head] is a full-width header.
/// [Left], [Body], and [Right] fill the rest of the height and divide width
/// amongs themselves.
class RegionLocation extends MTSkinConstant {
  const RegionLocation._internal(String className) : super(className);

  static const Head = const RegionLocation._internal('reg-head');
  static const Left = const RegionLocation._internal('reg-left');
  static const Body = const RegionLocation._internal('reg-body');
  static const Right = const RegionLocation._internal('reg-right');

  static get values => [Head, Left, Body, Right];
}

class RegionActions extends Disposable {
  // Removes the [Content] with the given [runtimeId]
  Action<String> removeProduct = new Action<String>();

  RegionActions() {
    [
      removeProduct,
    ].forEach(manageDisposable);
  }
}

class RegionState extends Disposable {
  RegionState();

  /// The current active index
  String activeKey;

  /// The map of contents by their active indices
  Map<String, Product> productItems = {};

  /// Whether to render the active region
  bool shouldRenderRegion = true;
}

class RegionManager extends Store {
  RegionState _state;

  RegionManager() {
    _state = new RegionState();

    _actions = new RegionActions();
    manageActionSubscription(_actions.removeProduct.listen(removeProduct));

    didDispose.then((_) {
      _state = null;
      _actions = null;
    });
  }

  /// This manager's actions
  RegionActions get actions => _actions;
  RegionActions _actions;

  /// Whether there is active content to render
  bool get shouldRenderRegion =>
      _state.shouldRenderRegion && _state.activeKey != null;

  // The currently-active content or null
  Product get activeProduct {
    if (_state.activeKey == null) {
      return null;
    }
    return _state.productItems[_state.activeKey];
  }

  void addProduct(Product product) {
    if (_state.productItems.containsKey(product.runtimeId)) {
      _log.warning('Product ${product.runtimeId} is already in region');
      return;
    }
    _state.productItems[product.runtimeId] = product;
    trigger();
  }

  Future<Null> removeProduct(String runtimeId) async {
    if (!_state.productItems.containsKey(runtimeId)) {
      _log.warning(
          'Product $runtimeId cannot be removed beacuse is not in region');
      return;
    }

    _state.productItems.remove(runtimeId);
    trigger();
  }

  /// Sets the given content to the actively rendered one
  void setActiveProduct(String runtimeId) {
    if (_state.productItems[runtimeId] == null) {
      _log.warning('Could not set active product: ID not found. $runtimeId');
    } else {
      _state.activeKey = runtimeId;
      if (!_state.shouldRenderRegion) {
        setActive(); // this function will trigger
      } else {
        trigger();
      }
    }
  }

  /// Tells the region to render whatever is currently active if anything.
  void setActive() {
    if (_state.shouldRenderRegion) {
      return;
    }
    if (_state.activeKey == null) {
      _log.warning('Cannot set region active without active product');
      return;
    }
    _state.shouldRenderRegion = true;
    trigger();
  }

  void setInactive() {
    if (!_state.shouldRenderRegion) {
      _log.info('Region is already inactive');
      return;
    }
    _state.shouldRenderRegion = false;
    trigger();
  }
}
