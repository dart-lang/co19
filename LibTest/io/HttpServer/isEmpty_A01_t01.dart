/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> isEmpty
 * Reports whether this stream contains any elements.
 *
 * Stops listening to the stream after the first element has been received.
 *
 * Internally the method cancels its subscription after the first element. This
 * means that single-subscription (non-broadcast) streams are closed and cannot
 * be reused after a call to this getter.
 * @description Checks that this property returns whether this stream contains
 * any elements
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

test() async {
  HttpServer server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 0);

  server.isEmpty.then((bool value) {
    Expect.isFalse(value);
    asyncEnd();
    print(value);
    server.close(force: true);
  });

  HttpClient client = new HttpClient();
  client
      .getUrl(Uri.parse(
      "http://${InternetAddress.LOOPBACK_IP_V4.address}:${server.port}"))
      .then((HttpClientRequest request) {
    return request.close();
  });
}

main() {
  asyncStart();
  test();
}
