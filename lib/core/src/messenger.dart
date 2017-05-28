import 'dart:async';

import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:mtproj/mt_api.dart' as api;
import 'package:thrift/thrift.dart';
import 'package:thrift/thrift_browser.dart';
import 'package:uuid/uuid.dart';
import 'package:w_common/w_common.dart';

import 'environment.dart';
import 'session.dart';

Logger _log = new Logger('mtproj.messenger');

class Messenger extends Disposable {
  Uuid _uuid;
  Environment _environment;
  Session _session;

  bool get isLoaded => _isLoaded;
  bool _isLoaded = false;

  TTransport _transport;
  api.MTProjClient _client;

  Messenger({
    @required Environment environment,
    @required Session session,
  })
      : _environment = environment,
        _session = session,
        _uuid = new Uuid();

  Future<Null> load() async {
    await _initConnection()
        .catchError((e) => _log.severe(e.message))
        .then((success) {
      if (success) {
        _isLoaded = true;
        _log.info('Messenger initialized successfully');
      } else {
        _log.warning('Failed to start messenger.');
      }
    });
    return _isLoaded;
  }

  Future<bool> _initConnection() async {
    _transport = new TAsyncClientSocketTransport(
      new TWebSocket(Uri.parse(urlForEnvironment[_environment])),
      new TMessageReader(new TBinaryProtocolFactory()),
    );

    TBinaryProtocol protocol = new TBinaryProtocol(_transport);

    // TODO retry logic
    try {
      await _transport.open();
    } catch (e) {
      _log.severe(e);
      return false;
    }

    _client = new api.MTProjClient(protocol);
    return true;
  }

  api.Context _makeContext(String method) => new api.Context()
    ..correlationId = '[${_uuid.v4()}] ${_session.userId} - $method'
    ..userId = _session.userId;

  /// Sends a server API request to get the project meta data
  Future<api.Project> getProjectMeta(String projectId) =>
      _client.getProjectMeta(_makeContext('getProjectMeta'), projectId);

  /// Sends a server API request to get the project list for a user
  Future<Map<String, api.Project>> getProjectListForUser() =>
      _client.getProjectListForUser(_makeContext('getProjectListForUser'));

  /// Sends a server API request to get a file tree
  Future<api.FileMeta> getFileTree(String projectId) =>
      _client.getFileTreeForProject(_makeContext('getFileTree'), projectId);

  Future<String> getFileContent(String fileId) =>
      _client.getFileContent(_makeContext('getFileContent'), fileId);
}
