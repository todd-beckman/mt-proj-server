import 'package:w_module/w_module.dart';

class FileTreeEvents extends EventsCollection {
  /// Notifies when the list of files has been received.
  final Event onReceivedDocumentList;

  /// Notifies that the given document ID has been selected in the tree
  final Event<String> onDocumentSelected;

  FileTreeEvents(DispatchKey dispatchKey)
      : onReceivedDocumentList = new Event(dispatchKey),
        onDocumentSelected = new Event(dispatchKey),
        super(dispatchKey) {
    [
      onDocumentSelected,
    ].forEach(manageEvent);
  }
}
