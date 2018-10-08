/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isBroadcast
 * Whether this stream is a broadcast stream.
 * @description Checks that the [isBroadcast] returns false.
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
        Expect.isTrue(websocket.isBroadcast == false);
        websocket.close();
        Expect.isTrue(websocket.isBroadcast == false);
      });
    });

    var webs = WebSocket.connect("ws://127.0.0.1:${server.port}/");
    webs.then((client) {
      Expect.isTrue(client.isBroadcast == false);
      client.close().then((_) {
        Expect.isTrue(client.isBroadcast == false);
        server.close();
      });
    });
  });
}
