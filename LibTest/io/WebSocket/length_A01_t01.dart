// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<int> length
/// Counts the elements in the stream.
/// @description Checks that the [length] returns the Future<int>.
/// @author ngl@unipro.ru

import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  HttpServer.bind("127.0.0.1", 0).then((server) {
    server.listen((request) {
      WebSocketTransformer
          .upgrade(request)
          .then((websocket) {
        var v = websocket.length;
        Expect.isTrue(v is Future<int>);
        Expect.runtimeIsType<Future<int>>(v);
        websocket.close();
      });
    });

    var webs = WebSocket.connect("ws://127.0.0.1:${server.port}/");
    webs.then((client) async {
      var value = await client.length;
      Expect.equals(0, value);
      client.close().then((_) async {
        await server.close();
      });
    });
  });
}
