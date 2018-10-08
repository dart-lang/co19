/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Duration pingInterval
 * Set and get the interval for sending ping signals. If a ping message is not
 * answered by a pong message from the peer, the WebSocket is assumed
 * disconnected and the connection is closed with a WebSocketStatus.GOING_AWAY
 * close code. When a ping signal is sent, the pong message must be received
 * within pingInterval.
 * @description Checks that the [pingInterval] is set correctly.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  HttpServer.bind("127.0.0.1", 0).then((server) {
    server.listen((request) {
      WebSocketTransformer
          .upgrade(request)
          .then((websocket) {
        Expect.isTrue(websocket.pingInterval == null);
        websocket.pingInterval = const Duration(milliseconds: 100);
        Expect.isTrue(websocket.pingInterval.toString() == "0:00:00.100000");
        websocket.close();
      });
    });

    var webs = WebSocket.connect("ws://127.0.0.1:${server.port}/");
    webs.then((client) {
      client.close().then((_) {
        server.close();
      });
    });
  });
}
