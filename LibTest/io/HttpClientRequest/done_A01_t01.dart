/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<HttpClientResponse> done
 * A HttpClientResponse future that will complete once the response is
 * available. If an error occurs before the response is available, this future
 * will complete with an error.
 * @description Checks that this future completes once the response is
 * available
 * @author sgrekhov@unipro.ru
 * @issue 31599
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
        request.done.then((HttpClientResponse response) {
          asyncEnd();
          response.cast<List<int>>().transform(utf8.decoder).listen((content) {
          });
        });
        return request.close();
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
