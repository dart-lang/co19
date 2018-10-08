/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * WebSocket.fromUpgradedSocket(
 *     Socket socket, {
 *     String protocol,
 *     bool serverSide,
 *     CompressionOptions compression: CompressionOptions.compressionDefault
 * })
 * Creates a WebSocket from an already-upgraded socket.
 *
 * The initial WebSocket handshake must have occurred prior to this call. A
 * WebSocket client can automatically perform the handshake using
 * WebSocket.connect, while a server can do so using
 * WebSocketTransformer.upgrade. To manually upgrade an HttpRequest,
 * HttpResponse.detachSocket may be called.
 *
 * protocol should be the protocol negotiated by this handshake, if any.
 *
 * serverSide must be passed explicitly. If it's false, the WebSocket will act
 * as the client and mask the messages it sends. If it's true, it will act as
 * the server and will not mask its messages.
 *
 * If compression is provided, the WebSocket created will be configured to
 * negotiate with the specified CompressionOptions. If none is specified then
 * the WebSocket will be created with the default CompressionOptions.
 *
 * @description Checks that this constructor creates a new WebSocketTransformer
 * object.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  HttpServer.bind("127.0.0.1", 0).then((server) {
    server.listen((request) {});
    var socket1 = Socket.connect("127.0.0.1", server.port);
    socket1.then((socket) {
      var websocket = new WebSocket.fromUpgradedSocket(socket,
          protocol: "p1.com", serverSide: true);
      Expect.isTrue(websocket is WebSocket);
      websocket.close();
      socket.done.then((_) {
        socket.destroy();
        server.close();
      });
    });
  });
}
