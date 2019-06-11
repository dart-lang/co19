/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void close({
 *  bool force: false
 *  })
 * Shut down the HTTP client. If force is false (the default) the HttpClient
 * will be kept alive until all active connections are done. If force is true
 * any active connections will be closed to immediately release all resources.
 * These closed connections will receive an error event to indicate that the
 * client was shut down. In both cases trying to establish a new connection
 * after calling close will throw an exception.
 * @description Checks that this method shuts down HTTP client
 * @author sgrekhov@unipro.ru
 * @issue 31492
 */
import "dart:io";
import "dart:async";
import "dart:convert";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4.address;

test() async {
  String helloWorld = "Hello test world!";
  HttpServer server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
  server.listen((HttpRequest request) {
    request.response.write(helloWorld);
    request.response.close();
  });

  new Timer(new Duration(seconds: 1), () {
    server.close();
    asyncEnd();
  });

  HttpClient client = new HttpClient();
  client.getUrl(Uri.parse("http://${localhost}:${server.port}"))
      .then((HttpClientRequest request) => request.close())
      .then((HttpClientResponse response) {
    response.cast<List<int>>().transform(utf8.decoder).listen((content) {
      Expect.equals(helloWorld, content);
      client.close(force: true);

      client.getUrl(Uri.parse("http://${localhost}:${server.port}"))
          .then((HttpClientRequest request) {
        return request.close();
      }).then((HttpClientResponse response) {
        Expect.fail("Request should not be sent!");
      });
    });
  });
}

main() {
  asyncStart();
  test();
}
