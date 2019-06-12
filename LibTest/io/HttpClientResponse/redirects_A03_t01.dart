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
 * @description Checks that this method returns the series of redirects this
 * connection has been through. Test more than one redirect
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4.address;

test(String method) async {
  asyncStart();
  HttpServer server = await HttpServer.bind(localhost, 0);
  server.listen((HttpRequest request) {
    if (request.uri.path == "/xxx") {
      request.response.write("xxx");
      request.response.close();
    } else if (request.uri.path == "/yyy") {
      request.response.write("yyy");
      request.response.close();
    } else if (request.uri.path == "/zzz") {
      request.response.write("zzz");
      request.response.close();
      server.close();
    } else {
      server.close();
      Expect.fail("Wrong URI:" + request.uri.path);
    }
  });

  HttpClient client = new HttpClient();
  client.open(method, localhost, server.port, "/xxx")
      .then((HttpClientRequest request) {
    return request.close();
  }).then((HttpClientResponse response) {
    response.cast<List<int>>().transform(utf8.decoder).listen((content) {
      Expect.equals("xxx", content);
    });
    response.redirect("get", new Uri(path: "yyy")).then((
        HttpClientResponse resp2) {
      resp2.cast<List<int>>().transform(utf8.decoder).listen((content2) {
        Expect.equals("yyy", content2);
      });
      resp2.redirect("post", new Uri(path: "zzz")).then((
          HttpClientResponse resp3) {
        Expect.equals(2, resp3.redirects.length);

        Expect.equals("get", resp3.redirects[0].method);
        Expect.equals("yyy", resp3.redirects[0].location.path);
        Expect.equals(200, resp3.redirects[0].statusCode);

        Expect.equals("post", resp3.redirects[1].method);
        Expect.equals("zzz", resp3.redirects[1].location.path);
        Expect.equals(200, resp3.redirects[1].statusCode);

        resp3.cast<List<int>>().transform(utf8.decoder).listen((content3) {
          Expect.equals("zzz", content3);
          asyncEnd();
        });
      });
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
