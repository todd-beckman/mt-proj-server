import 'package:w_module/w_module.dart';

class LecternEvents extends EventsCollection {
  final Event onDocumentLoaded;

  LecternEvents(DispatchKey dispatchKey)
      : onDocumentLoaded = new Event(dispatchKey),
        super(dispatchKey) {
    [
      onDocumentLoaded,
    ].forEach(manageEvent);
  }
}
