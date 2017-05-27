import 'package:w_common/w_common.dart';
import 'package:w_flux/w_flux.dart';

/// This is the public API
class LecternApi {
  LecternActions _actions;
  LecternApi(LecternActions actions) : _actions = actions;
}

/// This is the internal API for the flux cycle
class LecternActions extends Disposable {
  Action<String> loadDocument = new Action<String>();

  LecternActions() {
    [
      loadDocument,
    ].forEach(manageDisposable);
  }
}
