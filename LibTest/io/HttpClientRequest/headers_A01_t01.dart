/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertionHttpHeaders headers
 * Returns the client request headers.
 *
 * The client request headers can be modified until the client request body is
 * written to or closed. After that they become immutable.
 * @description Checks that this property returns the client request headers.
 * Test default values
 * @author sgrekhov@unipro.ru
 * @issue 31583
 */
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4.address;

test(String method, int contentLength) async {
  asyncStart();
  String helloWorld = "Hello test world!";
  HttpServer server = await HttpServer.bind(localhost, 0);
  server.listen((HttpRequest request) {
    request.response.write(helloWorld);
    request.response.close();
    server.close();
  });

  HttpClient client = new HttpClient();
  client.open(method, localhost, server.port, "")
      .then((HttpClientRequest request) {
        Expect.isNotNull(request.headers);
        Expect.equals(server.port, request.headers.port);
        Expect.equals(localhost, request.headers.host);
        Expect.equals(contentLength, contentLength);
        return request.close();
  }).then((HttpClientResponse response) {
    response.cast<List<int>>().transform(utf8.decoder).listen((content) {});
    asyncEnd();
  });
}

main() {
  test("get", 0);
  test("head", 0);
  test("delete", -1);
  test("put", -1);
  test("post", -1);
  test("patch", -1);
}
