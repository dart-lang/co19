/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Future<WebSocket> upgrade(
 *     HttpRequest request, {
 *     dynamic protocolSelector(List<String> protocols),
 *     CompressionOptions compression: CompressionOptions.compressionDefault
 * })
 * Upgrades a HttpRequest to a WebSocket connection. If the request is not a
 * valid WebSocket upgrade request an HTTP response with status code 500 will
 * be returned. Otherwise the returned future will complete with the WebSocket
 * when the upgrade process is complete.
 * @description Checks that the method [upgrate] returns Future<WebSocket>.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  var protocols = ["p1.com", "p2.com"];
  select(List<String> receivedProtocols) {
    Expect.listEquals(protocols, receivedProtocols);
    return protocols[0];
  }

  var webs;
  HttpServer.bind("127.0.0.1", 0).then((server) {
    server.listen((request) {
      webs = WebSocketTransformer.upgrade(request, protocolSelector: select);
      Expect.isTrue(webs is Future<WebSocket>);
      webs.then((websocket) {
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
