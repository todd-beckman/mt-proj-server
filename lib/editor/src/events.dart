import 'package:w_module/w_module.dart';

class EditorEvents extends EventsCollection {
  final Event onDocumentLoaded;
  final Event onSentDocument;

  EditorEvents(DispatchKey dispatchKey)
      : onDocumentLoaded = new Event(dispatchKey),
        onSentDocument = new Event(dispatchKey),
        super(dispatchKey) {
    [
      onDocumentLoaded,
      onSentDocument,
    ].forEach(manageEvent);
  }
}
