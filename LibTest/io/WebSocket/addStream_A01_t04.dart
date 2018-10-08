/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future addStream(Stream stream)
 *  Sends data from a stream on WebSocket connection. Each data event from
 *  stream will be send as a single WebSocket frame. The data from stream must
 *  be either Strings, or List<int>s holding bytes.
 * @description Checks that the String data are sent on the WebSocket
 * connection from client.
 * @author a.semenov@unipro.ru
 */
import "dart:io";
import "dart:convert";
import "dart:async";
import "../../../Utils/expect.dart";
import "../http_utils.dart";

const Utf8Codec CODEC = const Utf8Codec();
List<List<int>> BYTES = [CODEC.encode("Hello"), CODEC.encode(","), CODEC.encode("World")];

main() {
  asyncTest<HttpServer>(
    (HttpServer server) async {
       WebSocket ws = await WebSocket.connect("ws://${server.address.address}:${server.port}/");
       await ws.addStream(new Stream.fromIterable(BYTES));
       ws.close();
    },
    setup: () => spawnWebSocketServer(
      (WebSocket ws) => AsyncExpect.data(BYTES, ws)
    ),
    cleanup: (HttpServer server) => server.close()
  );
}
