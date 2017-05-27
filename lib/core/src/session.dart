import 'package:meta/meta.dart';

class Session {
  String get userId => _userId;
  String _userId;

  Session({
    @required String userId,
  })
      : _userId = userId;
}
