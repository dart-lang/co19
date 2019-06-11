/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future flush()
 * Returns a Future that completes once all buffered data is accepted by the
 * underlying StreamConsumer.
 *
 * This method must not be called while an addStream is incomplete.
 *
 * NOTE: This is not necessarily the same as the data being flushed by the
 * operating system.
 * @description Checks that this method must not be called while an addStream is
 * incomplete.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:async";
import "dart:convert";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4.address;

test(String method) async {
  Stream<List> stream = new Stream<List>.fromIterable(
      [[1, 2, 3, 4, 5], [12], [3, 14, 15]]);

  asyncStart();
  String helloWorld = "Hello test world!";
  HttpServer server = await HttpServer.bind(localhost, 0);
  server.listen((HttpRequest request) {
    request.toList().then((data) {
      Expect.listEquals([[1, 2, 3, 4, 5, 12, 3, 14, 15]], data);
      request.response.write(helloWorld);
      request.response.close();
      server.close();
    });
  });

  HttpClient client = new HttpClient();
  client.open(method, localhost, server.port, "")
      .then((HttpClientRequest request) {
    request.contentLength = 9;
    request.addStream(stream).then((var request) {
      return request.close();
    }).then((var response) {
      response.cast<List<int>>().transform(utf8.decoder).listen((content) {});
      asyncEnd();
    });
    Expect.throws(() {request.flush();});
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
