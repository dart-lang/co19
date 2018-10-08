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
 * @description Checks that it is an error to call close() after flush() if
 * request was written to
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4.address;

test(String method) async {
  asyncStart();
  HttpServer server = await HttpServer.bind(localhost, 0);

  HttpClient client = new HttpClient();
  client.open(method, localhost, server.port, "")
      .then((HttpClientRequest request) {
    request.contentLength = 13;
    request.write("Lily was here");
    request.flush().then((r) {
      Expect.equals(r, request);
      server.close();
      client.close(force: true);
      asyncEnd();
    });
    Expect.throws(() {request.close();});
    return;
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
