/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Future<WebSocket> connect(
 *     String url, {
 *     Iterable<String> protocols,
 *     Map<String, dynamic> headers,
 *     CompressionOptions compression: CompressionOptions.DEFAULT
 * })
 * Create a new WebSocket connection. The URL supplied in url must use the
 * scheme ws or wss.
 * The protocols argument is specifying the subprotocols the client is willing
 * to speak.
 * The headers argument is specifying additional HTTP headers for setting up
 * the connection. This would typically be the Origin header and potentially
 * cookies. The keys of the map are the header fields and the values are either
 * String or List.
 * If headers is provided, there are a number of headers which are controlled by
 * the WebSocket connection process. These headers are:
 * - connection
 * - sec-websocket-key
 * - sec-websocket-protocol
 * - sec-websocket-version
 * - upgrade
 * If any of these are passed in the headers map they will be ignored.
 * If the url contains user information this will be passed as basic
 * authentication when setting up the connection.
 * @description Checks that the static method WebSocket.connect creates a new
 * Future that will complete with WebSocket.
 * @author ngl@unipro.ru
 */
import "dart:async";
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
    Expect.isTrue(webs is Future<Socket>);
    webs.then((client) {
      Expect.isTrue(client is WebSocket);
      client.close();
      server.close();
    });
  });
}
