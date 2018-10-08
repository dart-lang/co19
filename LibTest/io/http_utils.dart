/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * http and web sockets utils
 * @author a.semenov@unipro.ru
 */
library http_utils;

import "dart:io";
import "dart:async";

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
