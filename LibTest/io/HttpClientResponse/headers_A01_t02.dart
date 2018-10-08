/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion HttpHeaders headers
 * Returns the client response headers.
 * The client response headers are immutable.
 * @description Checks that this property returns the client response headers.
 * Test not default headers
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4.address;

test(String method) async {
  asyncStart();
  HttpServer server = await HttpServer.bind(localhost, 0);
  server.listen((HttpRequest request) {
    request.response.headers.add(HttpHeaders.ageHeader, 21);
    request.response.headers.add(HttpHeaders.teHeader, "");
    request.response.close();
    server.close();
  });

  HttpClient client = new HttpClient();
  client.open(method, localhost, server.port, "")
      .then((HttpClientRequest request) {
    return request.close();
  }).then((HttpClientResponse response) {
    Expect.equals("text/plain; charset=utf-8",
        response.headers.value("content-type"));
    Expect.equals("21", response.headers.value(HttpHeaders.ageHeader));
    Expect.equals("", response.headers.value(HttpHeaders.teHeader));
    asyncEnd();
  });
}

main() {
  test("get");
  test("head");
  test("delete");
  test("put");
  test("post");
  test("patch");
}
