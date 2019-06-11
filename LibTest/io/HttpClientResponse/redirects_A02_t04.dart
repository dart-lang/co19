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
 * connection has been through. Test PUT redirect
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
      server.close();
    } else {
      server.close();
      Expect.fail("Wrong URI:" + request.uri.path);
    }
  });

  HttpClient client = new HttpClient();
  client
      .open(method, localhost, server.port, "/xxx")
      .then((HttpClientRequest request) {
    return request.close();
  }).then((HttpClientResponse response) {
    response.cast<List<int>>().transform(utf8.decoder).listen((content) {
      Expect.equals("xxx", content);
    });
    response
        .redirect("put", new Uri(path: "yyy"))
        .then((HttpClientResponse resp) {
      Expect.equals(1, resp.redirects.length);
      Expect.equals("put", resp.redirects[0].method);
      Expect.equals("yyy", resp.redirects[0].location.path);
      Expect.equals(200, resp.redirects[0].statusCode);
      resp.cast<List<int>>().transform(utf8.decoder).listen((content2) {
        asyncEnd();
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
