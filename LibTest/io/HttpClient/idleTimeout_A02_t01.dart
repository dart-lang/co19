/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Duration idleTimeout
 *  read / write
 * Get and set the idle timeout of non-active persistent (keep-alive)
 * connections. The default value is 15 seconds.
 * @description Checks idle timeout and keep alive connection
 * @author sgrekhov@unipro.ru
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
    Expect.listEquals(["keep-alive"], request.headers[HttpHeaders.connectionHeader]);
    request.response.persistentConnection = true;
    request.response.contentLength = helloWorld.length * 2;
    request.response.write(helloWorld);
    new Timer(new Duration(seconds: 2), () {
      request.response.write(helloWorld);
      request.response.close();
      server.close();
      asyncEnd();
    });
  });

  HttpClient client = new HttpClient();
  client.idleTimeout = new Duration(seconds: 1);
  client.getUrl(Uri.parse("http://${localhost}:${server.port}"))
      .then((HttpClientRequest request) {
    request.headers.set(HttpHeaders.connectionHeader, "keep-alive");
    return request.close();
  }).then((HttpClientResponse response) {
    response.cast<List<int>>().transform(utf8.decoder).listen((content) {
      Expect.equals(helloWorld + helloWorld, content);
    });
  });
}

main() {
  asyncStart();
  test();
}
