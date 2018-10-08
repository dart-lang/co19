/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> first
 * ...
 * Stops listening to the stream after the first element has been received.
 *
 * Internally the method cancels its subscription after the first element. This
 * means that single-subscription (non-broadcast) streams are closed and cannot
 * be reused after a call to this getter.
 * @description Checks that this property stops listening to the stream after
 * the first element has been received
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

test() async {
  HttpServer server = null;
  server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
  server.first.then((HttpRequest request) {
    Expect.equals(6, request.contentLength);
    request.response.close();
    asyncEnd();
  });

  asyncStart();
  HttpClient client = new HttpClient();
  client
      .getUrl(Uri.parse(
          "http://${InternetAddress.loopbackIPv4.address}:${server.port}"))
      .then((HttpClientRequest request) {
    request.contentLength = 6;
    request.writeln("hello");
    return request.close();
  }).then((HttpClientResponse response) {
    bool thrown = false;
    try {
      client.getUrl(Uri.parse(
          "http://${InternetAddress.loopbackIPv4.address}:${server.port}"));
    } on HttpException {
      thrown = true;
    }
    Expect.isTrue(thrown);
    asyncEnd();
  });
}

main() {
  asyncStart();
  test();
}
