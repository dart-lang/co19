/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> first
 * Returns the first element of the stream.
 * @description Checks that the first element is returned.
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

  HttpClient client = new HttpClient();
  client
      .getUrl(Uri.parse(
          "http://${InternetAddress.loopbackIPv4.address}:${server.port}"))
      .then((HttpClientRequest request) {
    request.contentLength = 6;
    request.writeln("hello");
    return request.close();
  });
}

main() {
  asyncStart();
  test();
}
