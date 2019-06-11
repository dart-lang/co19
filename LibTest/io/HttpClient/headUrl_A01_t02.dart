/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<HttpClientRequest> headUrl(
 *  Uri url
 *  )
 * Opens a HTTP connection using the HEAD method.
 *
 * The URL to use is specified in url.
 *
 * See openUrl for details.
 * @description Checks that this method opens a HTTP connection using the HEAD
 * method and path may contain query
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4.address;

test() async {
  String helloWorld = "Hello test world!";
  HttpServer server = await HttpServer.bind(localhost, 0);
  server.listen((HttpRequest request) {
    Expect.equals("HEAD", request.method);
    Expect.equals("/y/xxx?q=12&i=j", request.uri.toString());
    request.response.write(helloWorld);
    request.response.close();
    server.close();
    asyncEnd();
  });

  HttpClient client = new HttpClient();
  client.headUrl(Uri
          .parse("http://${localhost}:${server.port}/y/xxx?q=12&i=j#fragment"))
      .then((HttpClientRequest request) => request.close())
      .then((HttpClientResponse response) {
    response.cast<List<int>>().transform(utf8.decoder).listen((content) {
      Expect.equals(helloWorld, content);
    });
  });
}

main() {
  asyncStart();
  test();
}
