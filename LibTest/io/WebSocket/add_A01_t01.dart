/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(data)
 * Sends data on the WebSocket connection. The data in data must be either a
 * String, or a List<int> holding bytes.
 * @description Checks that the String data are send on the WebSocket
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
        websocket.add("Hello");
        websocket.close();
      });
    });

    var webs = WebSocket.connect("ws://127.0.0.1:${server.port}/");
    webs.then((client) {
      return client.listen((message) {
        Expect.equals("Hello", message);
        client.close();
      }).asFuture();
    }).then((_) => server.close());
  });
}
