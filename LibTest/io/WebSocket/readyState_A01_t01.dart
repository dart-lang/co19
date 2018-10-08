/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int readyState
 * Returns the current state of the connection.
 * @description Checks that the [readyState] returns the current state of
 * connection.
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
        websocket.close();
      });
    });

    var webs = WebSocket.connect("ws://127.0.0.1:${server.port}/");
    webs.then((client) {
      Expect.isTrue(client.readyState == WebSocket.open);
      client.close().then((_) {
        Expect.isTrue(client.readyState == WebSocket.closed);
        server.close();
      });
    });
  });
}
