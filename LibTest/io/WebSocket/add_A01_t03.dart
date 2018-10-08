/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(data)
 * Sends data on the WebSocket connection. The data in data must be either a
 * String, or a List<int> holding bytes.
 * @description Checks that the String data are sent on the WebSocket
 * connection from client.
 * @author a.semenov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../http_utils.dart";

main() {
  asyncTest<HttpServer>(
    (HttpServer server) async {
      WebSocket ws = await WebSocket.connect("ws://${server.address.address}:${server.port}/");
      ws.add("Hello");
      ws.close();
    },
    setup: () => spawnWebSocketServer(
      (WebSocket ws) => AsyncExpect.data(["Hello"], ws)
    ),
    cleanup: (HttpServer server) => server.close()
  );
}
