/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future addStream(Stream<List<int>> stream)
 *  Adds all elements of the given stream to this.
 *
 * Returns a Future that completes when all elements of the given stream are
 * added to this.
 * @description Checks that the [stream] can be added is another stream has been
 * already added.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:async";
import "dart:convert";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4.address;

test(String method) async {
  Stream<List> stream1 = new Stream<List>.fromIterable(
      [[1, 2, 3, 4, 5], [12]]);
  Stream<List> stream2 = new Stream<List>.fromIterable(
      [[3, 14, 15], [9, 2, 6]]);

  asyncStart();
  String helloWorld = "Hello test world!";
  HttpServer server = await HttpServer.bind(localhost, 0);
  server.listen((HttpRequest request) {
    request.toList().then((data) {
      Expect.listEquals([[1, 2, 3, 4, 5], [12], [3, 14, 15], [9, 2, 6]], data);
      request.response.write(helloWorld);
      request.response.close();
      server.close();
    });
  });

  HttpClient client = new HttpClient();
  client.open(method, localhost, server.port, "").then((var request) {
    request.contentLength = -1;
    request.addStream(stream1).then((var request) {
      request.addStream(stream2).then((HttpClientRequest request) {
        return request.close();
      }).then((HttpClientResponse response) {
        response.cast<List<int>>().transform(utf8.decoder).listen((content) {});
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
