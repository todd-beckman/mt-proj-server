import 'package:w_common/w_common.dart';
import 'package:w_flux/w_flux.dart';

import 'package:mtproj/mt_api.dart' as api;

/// The external API
class FileTreeApi extends Disposable {}

/// The internal API for the Flux cycle
class FileTreeActions extends Disposable {
  Action<String> selectDocument = new Action<String>();

  FileTreeActions() {
    [
      selectDocument,
    ].forEach(manageDisposable);
  }
}
