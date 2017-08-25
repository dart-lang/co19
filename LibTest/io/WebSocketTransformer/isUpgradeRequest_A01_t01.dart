/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isUpgradeRequest(HttpRequest request)
 * Checks whether the request is a valid WebSocket upgrade request.
 * @description Checks that he method [isUpgradeRequest] return true if a
 * parameter is a valid WebSocket upgrade request.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  var protocols = ["p1.com", "p2.com"];
  selector(List<String> receivedProtocols) {
    Expect.listEquals(protocols, receivedProtocols);
    return protocols[0];
  }

  HttpServer.bind("127.0.0.1", 0).then((server) {
    server.listen((request) {
      Expect.isTrue(WebSocketTransformer.isUpgradeRequest(request) is bool);
      WebSocketTransformer
          .upgrade(request, protocolSelector: selector)
          .then((websocket) {
        websocket.close();
      });
    });
    WebSocket
        .connect("ws://127.0.0.1:${server.port}/", protocols: protocols)
        .then((client) {
      client.close();
      server.close();
    });
  });
}
