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
 * @description Checks that if the Server header is added here and the
 * serverHeader is set as well then the value of serverHeader takes precedence
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

test() async {
  HttpServer server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
  asyncStart();
  server.serverHeader = "my-server-header-value";
  server.defaultResponseHeaders.add("server", "my-server-header-value-2");
  server.listen((HttpRequest request) {
    request.response.close();
    server.close();
    asyncEnd();
  });

  asyncStart();
  HttpClient client = new HttpClient();
  client
      .getUrl(Uri.parse(
      "http://${InternetAddress.loopbackIPv4.address}:${server.port}"))
      .then((HttpClientRequest request) {
    return request.close();
  }).then((HttpClientResponse response) {
    int counter = 0;
    response.headers.forEach((String name, List<String> value) {
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
      if (name == "server") {
        Expect.listEquals(["my-server-header-value"], value);
        counter++;
      }
    });
    Expect.equals(5, counter);
    asyncEnd();
  });
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
