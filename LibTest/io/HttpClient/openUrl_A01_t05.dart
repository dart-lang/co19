/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<HttpClientRequest> openUrl(
 *  String method,
 *  Uri url
 *  )
 * Opens a HTTP connection.
 *
 * The HTTP method is specified in method and the URL to use in url.
 *
 * The Host header for the request will be set to the value Uri.host:Uri.port
 * from url. This can be overridden through the HttpClientRequest interface
 * before the request is sent. NOTE if host is an IP address this will still be
 * set in the Host header.
 *
 * For additional information on the sequence of events during an HTTP
 * transaction, and the objects returned by the futures, see the overall
 * documentation for the class HttpClient.
 * @description Checks that the Host header for the request be overridden
 * through the HttpClientRequest interface before the request is sent
 * @author sgrekhov@unipro.ru
 * @issue 31527
 * @issue 31528
 */
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4.address;

test() async {
  String helloWorld = "Hello test world!";
  HttpServer server = await HttpServer.bind(localhost, 0);
  server.listen((HttpRequest request) {
    Expect.equals("GET", request.method);
    Expect.equals("/Xxx?q=12&i=j", request.uri.toString());
    Expect.equals("dartlang.org", request.headers.host);
    Expect.equals(111, request.headers.port);
    request.response.write(helloWorld);
    request.response.close();
    server.close();
    asyncEnd();
  });

  HttpClient client = new HttpClient();
  client.openUrl("get",
      Uri.parse("http://${localhost}:${server.port}/Xxx?q=12&i=j#fragment"))
      .then((HttpClientRequest request) {
    request.headers.host = "dartlang.org";
    request.headers.port = 111;
    return request.close();
  }).then((HttpClientResponse response) {
    response.cast<List<int>>().transform(utf8.decoder).listen((content) {
      Expect.equals(helloWorld, content);
    });
  });
}

main() {
  asyncStart();
  test();
}
