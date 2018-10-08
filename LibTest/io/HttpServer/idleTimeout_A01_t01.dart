/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Duration idleTimeout
 * read / write
 * Get or set the timeout used for idle keep-alive connections. If no further
 * request is seen within idleTimeout after the previous request was completed,
 * the connection is dropped.
 *
 * Default is 120 seconds.
 *
 * Note that it may take up to 2 * idleTimeout before a idle connection is
 * aborted.
 *
 * To disable, set idleTimeout to null.
 * @description Checks that default value of this property is 120 seconds
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  asyncStart();
  HttpServer server = null;
  HttpServer.bind(InternetAddress.loopbackIPv4, 0).then((HttpServer s) {
    server = s;
    Expect.equals(120, server.idleTimeout.inSeconds);

    server.idleTimeout = new Duration(seconds: 10);
    Expect.equals(10, server.idleTimeout.inSeconds);
    asyncEnd();
  }).whenComplete(() {
    if (server != null) {
      server.close();
    }
  });
}
