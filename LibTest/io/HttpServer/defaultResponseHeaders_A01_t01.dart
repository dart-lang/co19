/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion HttpHeaders defaultResponseHeaders
 * Default set of headers added to all response objects.
 *
 * By default the following headers are in this set:
 *
 *  Content-Type: text/plain; charset=utf-8
 *  X-Frame-Options: SAMEORIGIN
 *  X-Content-Type-Options: nosniff
 *  X-XSS-Protection: 1; mode=block
 *
 * If the Server header is added here and the serverHeader is set as well then
 * the value of serverHeader takes precedence.
 * @description Checks that this property returns default set of headers added
 * to all response objects
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  asyncStart();
  HttpServer server = null;
  HttpServer.bind(InternetAddress.loopbackIPv4, 0).then((HttpServer s) {
    server = s;
    int counter = 0;
    int total = 0;
    server.defaultResponseHeaders.forEach((String name, List<String> value) {
      if (name == "x-frame-options") {
        Expect.listEquals(["SAMEORIGIN"], value);
        counter++;
      }
      if (name == "content-type") {
        Expect.listEquals(["text/plain; charset=utf-8"], value);
        counter++;
      }
      if (name == "x-xss-protection") {
        Expect.listEquals(["1; mode=block"], value);
        counter++;
      }
      if (name == "x-content-type-options") {
        Expect.listEquals(["nosniff"], value);
        counter++;
      }
      total++;
    });
    Expect.equals(4, counter);
    Expect.equals(4, total);
    asyncEnd();
  }).whenComplete(() {
    if (server != null) {
      server.close();
    }
  });
}
