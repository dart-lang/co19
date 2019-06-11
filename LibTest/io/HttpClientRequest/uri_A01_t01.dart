/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uri uri
 * The uri of the request.
 * @description Checks that this getter returns the uri of the request
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4.address;

test(String method) async {
  asyncStart();
  String helloWorld = "Hello test world!";
  HttpServer server = await HttpServer.bind(localhost, 0);
  server.listen((HttpRequest request) {
    request.response.write(helloWorld);
    request.response.close();
    server.close();
  });

  HttpClient client = new HttpClient();
  client.open(method, localhost, server.port, "/xxx?q=1#fr")
    .then((HttpClientRequest request) {
      Expect.equals("http://${localhost}:${server.port}/xxx?q=1",
          request.uri.toString());
      return request.close();
    }).then((HttpClientResponse response) {
      response.cast<List<int>>().transform(utf8.decoder).listen((content) {});
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
