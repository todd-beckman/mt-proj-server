import 'dart:async';
import 'package:w_flux/w_flux.dart';
import 'package:w_common/w_common.dart';

/// This is the public API exposed to other components.
class EditorApi {
  final EditorActions _actions;

  EditorApi(EditorActions actions) : _actions = actions;

  /// Loads the document for the given ID
  Future loadDocument(String docId) => _actions.loadDocument(docId);

  Future saveDocument(String docId) => _actions.saveDocument(docId);
}

/// This is the internal API used in the Flux cycle
class EditorActions extends Disposable {
  Action<String> loadDocument = new Action<String>();
  Action saveDocument = new Action();

  EditorActions() {
    [
      loadDocument,
      saveDocument,
    ].forEach(manageDisposable);
  }
}
