/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addUtf8Text(List<int> bytes)
 *    Sends a text message with the text represented by bytes.
 *    The bytes should be valid UTF-8 encoded Unicode characters.
 * If they are not, the receiving end will close the connection.
 * @description Checks that the UTF-8 encoded string is sent on the WebSocket
 * connection from server.
 * @author a.semenov@unipro.ru
 * @issue #31051
 */
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";
import "../http_utils.dart";

const Utf8Codec utf8 = const Utf8Codec();

main() {
  asyncTest<HttpServer>(
    (HttpServer server) async =>
      AsyncExpect.data(
        ["Hello"],
        await WebSocket.connect("ws://${server.address.address}:${server.port}/")
      ),
    setup: () => spawnWebSocketServer(
      (WebSocket ws) {
        ws.addUtf8Text(utf8.encode("Hello"));
        ws.close();
      }
    ),
    cleanup: (HttpServer server) => server.close()
  );
}
