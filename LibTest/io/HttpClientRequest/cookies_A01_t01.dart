/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<Cookie> cookies
 * Cookies to present to the server (in the 'cookie' header).
 * @description Checks that this getter represents cookies
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
    Expect.isNotNull(request.cookies);
    Expect.equals(1, request.cookies.length);
    Expect.equals("cname" + method, request.cookies[0].name);
    Expect.equals("cval" + method, request.cookies[0].value);
    request.response.write(helloWorld);
    request.response.close();
    server.close();
    asyncEnd();
  });

  HttpClient client = new HttpClient();
  client.open(method, localhost, server.port, "")
      .then((HttpClientRequest request) {
        Expect.isNotNull(request.cookies.length);
        Expect.equals(0, request.cookies.length);
        request.cookies.add(new Cookie("cname" + method, "cval" + method));
        return request.close();
      })
      .then((HttpClientResponse response) {
        response.cast<List<int>>().transform(utf8.decoder).listen((content) {
          Expect.equals(helloWorld, content);
        });
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
