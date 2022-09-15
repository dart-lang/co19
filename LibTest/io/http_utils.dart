// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// http and web sockets utils
/// @author a.semenov@unipro.ru

library http_utils;

import "dart:io";
import "dart:async";
import "../../Utils/expect.dart";

/**
 * Spawns a HttpServer instance
 */
Future<HttpServer> spawnHttpServer(void requestHandler(HttpRequest request)) async {
  HttpServer server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
  server.listen(requestHandler);
  return server;
}

/**
 * Spawns a HttpServer instance that is intended to handle web sockets.
 */
Future<HttpServer> spawnWebSocketServer(void wsHandler(WebSocket webSocket)) {
  return spawnHttpServer((HttpRequest request) {
    WebSocketTransformer.upgrade(request).then(wsHandler);
  });
}

/**
 * Spawns a HttpServer instance that is intended to handle web sockets.
 * Each new connection receives the same [content] and then closed.
 */
Future<HttpServer> spawnStaticContentWebSocketServer(content) {
  return spawnWebSocketServer((WebSocket webSocket) {
    webSocket.add(content);
    webSocket.close();
  });
}

/**
 * Spawns a HttpServer instance that is intended to handle web sockets.
 * Each new connection is listened for first message and send it back,
 * then web socket is closed.
 */
Future<HttpServer> spawnEchoWebSocketServer() {
  return spawnWebSocketServer((WebSocket webSocket) async {
    webSocket.add(await webSocket.first);
    webSocket.close();
  });
}

List<int> _bigData = [];

List<int> get bigData  {
 if (_bigData.isEmpty) {
   _bigData = getList(8187);
 }
 return _bigData;
}

List<int> getList(int size) {
  List<int> l = [];
  for (int j = 0; j < size; j++) {
    l.add(j);
  }
  return l;
}

Future<int> sendDatagram(RawDatagramSocket producer, List<int> data,
    InternetAddress address, int port, {int attempts = 5}) async {
  int counter = 0;
  int sent = 0;
  while(counter++ < attempts) {
    sent = producer.send(data, address, port);
    if (sent > 0) {
      break;
    } else {
      await Future.delayed(Duration(milliseconds: 1));
    }
  };
  return Future.value(sent);
}

/**
 * Returns true if received datagram can be found among sent data
 */
bool containsReceived(List<List<int>> sent, Datagram d) {
  List<int> received = d.data.toList();
  if (received.length > 0) {
    Outer:
    for (int i = 0; i < sent.length; i++) {
      if (sent[i].length == received.length) {
        for (int j = 0; j < received.length; j++) {
          if (sent[i][j] != received[j]) {
            continue Outer;
          }
        }
        return true;
      }
    }
  }
  return false;
}
