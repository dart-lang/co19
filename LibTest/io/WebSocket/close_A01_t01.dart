// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future close([int code, String reason ])
/// Closes the WebSocket connection. Set the optional code and reason arguments
/// to send close information to the remote peer. If they are omitted, the peer
/// will see WebSocketStatus.noStatusReceived code with no reason.
/// @description Checks that the close method works correctly when its parameters
/// code and reason are set.
/// @author ngl@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";

main() {
  HttpServer.bind("127.0.0.1", 0).then((server) {
    server.listen((request) {
      WebSocketTransformer.upgrade(request).then((websocket) {
        websocket.close(WebSocketStatus.normalClosure, "closed");
      });
    });

    WebSocket.connect("ws://127.0.0.1:${server.port}/")
        .then((WebSocket ws) async {
      Expect.isNull(ws.closeCode);
      Expect.isNull(ws.closeReason);
      await ws.listen((_) {}).asFuture();
      Expect.equals(WebSocketStatus.normalClosure, ws.closeCode);
      Expect.equals("closed", ws.closeReason);
      await server.close();
    });
  });
}
