/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<RedirectInfo> redirects
 * Returns the series of redirects this connection has been through. The list
 * will be empty if no redirects were followed. redirects will be updated both
 * in the case of an automatic and a manual redirect.
 * @description Checks that this getter returns an empty list if there were no
 * redirects
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
  client.open(method, localhost, server.port, "")
      .then((HttpClientRequest request) {
    return request.close();
  }).then((HttpClientResponse response) {
    Expect.isTrue(response.redirects.isEmpty);
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
