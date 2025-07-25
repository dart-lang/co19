// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void addUtf8Text(List<int> bytes)
///    Sends a text message with the text represented by bytes.
///    The bytes should be valid UTF-8 encoded Unicode characters.
/// If they are not, the receiving end will close the connection.
/// @description Checks that the UTF-8 encoded string is sent on the WebSocket
/// connection in complex scenario.
/// @author a.semenov@unipro.ru
/// @issue #31051

import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";
import "../http_utils.dart";

const Utf8Codec utf8 = const Utf8Codec();

main() {
  asyncTest<HttpServer>(
    (HttpServer? server) async {
      WebSocket ws = await WebSocket.connect(
        "ws://${server?.address.address}:${server?.port}/",
      );
      await AsyncExpect.data(["Hello", "client"], ws.take(2));
      ws.addUtf8Text(utf8.encode("Hi"));
      ws.addUtf8Text(utf8.encode("server"));
      await ws.close();
    },
    setup: () {
      asyncStart();
      return spawnWebSocketServer((WebSocket ws) async {
        ws.addUtf8Text(utf8.encode("Hello"));
        ws.addUtf8Text(utf8.encode("client"));
        await AsyncExpect.data(["Hi", "server"], ws);
        asyncEnd();
        await ws.close();
      });
    },
    cleanup: (HttpServer? server) => server?.close(),
  );
}
