/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isBroadcast
 * Whether this stream is a broadcast stream.
 * @description Checks that this property returns false
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

test() async {
  HttpServer server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
  try {
    Expect.isFalse(server.isBroadcast);
  } finally {
    server.close();
  }

  server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0, shared: true);
  try {
    Expect.isFalse(server.isBroadcast);
  } finally {
    server.close();
  }
}

main() {
  test();
}
