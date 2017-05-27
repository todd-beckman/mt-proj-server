import 'dart:convert';

import 'package:logging/logging.dart';

/// Provides a set of "unique keys"; not thread-safe.
class KeyIncrementer {
  static int _key = 0;

  /// Get the next unique id
  static int get nextKey => _key++;
}

String encodeBase64ForUrl(String input) {
  return UTF8
      .fuse(BASE64)
      .encode(input)
      .replaceAll('+', '-')
      .replaceAll('/', '_')
      .replaceAll('=', '~');
}

String encodeBase64FromUrl(String input) {
  return UTF8
      .fuse(BASE64)
      .decode(input)
      .replaceAll('-', '+')
      .replaceAll('_', '/')
      .replaceAll('~', '=');
}

Logger newLogger(String name) {
  return new Logger('mt.$name');
}
