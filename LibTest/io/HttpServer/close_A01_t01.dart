/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future close({bool force: false})
 * Permanently stops this HttpServer from listening for new connections. This
 * closes the Stream of HttpRequests with a done event. The returned future
 * completes when the server is stopped. For a server started using bind or
 * bindSecure this means that the port listened on no longer in use.
 *
 * If force is true, active connections will be closed immediately.
 * @description Checks that this method permanently stops this HttpServer from
 * listening for new connections
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";

test() async {
  String helloWorld = 'Hello, test world!';
  HttpServer server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
  asyncStart();
  server.listen((HttpRequest request) {
    request.response.write(helloWorld);
    request.response.close();
    server.close();
    asyncEnd();
  });

  asyncStart();
  HttpClient client = new HttpClient();
  client
      .getUrl(Uri.parse(
      "http://${InternetAddress.loopbackIPv4.address}:${server.port}"))
      .then((HttpClientRequest request) {
    return request.close();
  }).then((HttpClientResponse response) {
    Expect.equals(HttpStatus.ok, response.statusCode);
    response.cast<List<int>>().transform(utf8.decoder).listen((content) {
      Expect.equals(helloWorld, content);
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
  });
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
