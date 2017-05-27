import 'dart:async';
import 'dart:io';

import 'package:mtproj/mt_api.dart';
import 'package:thrift/thrift.dart';
import 'package:thrift/thrift_browser.dart';

TProtocol _protocol;
TProcessor _processor;
WebSocket _webSocket;

void main() {
  _runWebSocketServer(5081);
}

Future _runWebSocketServer(int port) async {
  var httpServer = await HttpServer.bind('127.0.0.1', port);
  print('listening for WebSocket connections on $port');

  httpServer.listen((HttpRequest request) async {
    if (request.uri.path == '/ws') {
      _webSocket = await WebSocketTransformer.upgrade(request);
      await _initProcessor(new TWebSocket(request.uri), _webSocket);
    } else {
      print('Invalid path: ${request.uri.path}');
    }
  });
}

Future _initProcessor(TSocket socket, WebSocket ws) async {
  TServerSocketTransport transport = new TServerSocketTransport(socket);
  transport.onIncomingMessage
      .listen((_) => _processor.process(_protocol, _protocol));
  _processor; // = new MTProjProcessor(''); // TODO
  _protocol = new TBinaryProtocol(transport);
  await _protocol.transport.open();

  print('connected');
}
