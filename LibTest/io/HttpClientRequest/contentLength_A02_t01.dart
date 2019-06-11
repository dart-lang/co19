/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int contentLength
 *  read / write
 * Gets and sets the content length of the request. If the size of the request
 * is not known in advance set content length to -1, which is also the default.
 * @description Checks that setting contentLength value то -1 allows any content
 * length
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4.address;

test(method) async {
  asyncStart();
  String helloWorld = "Hello test world!";
  HttpServer server = await HttpServer.bind(localhost, 0);
  server.listen((HttpRequest request) {
    request.response.write(helloWorld);
    request.response.close();
    server.close();
    asyncEnd();
  });

  String data = "Hi there";
  HttpClient client = new HttpClient();
  client.open(method, localhost, server.port, "")
      .then((HttpClientRequest request) {
        request.contentLength = -1;
        request.write(data);
        return request.close();
      })
      .then((HttpClientResponse response) {
        response.cast<List<int>>().transform(utf8.decoder).listen((content) {
          Expect.equals(helloWorld, content);
        });
      });
}

main() {
  test("POST");
  test("DELETE");
  test("PUT");
  test("GET");
  test("HEAD");
  test("PATCH");
}
