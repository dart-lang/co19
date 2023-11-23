// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<HttpServer> bind(
///  address,
///  int port, {
///  int backlog: 0,
///  bool v6Only: false,
///  bool shared: false
/// }).
/// Starts listening for HTTP requests on the specified address and port.
/// @description Checks that this method starts listening for HTTP requests on
/// the specified address and port
/// @author sgrekhov@unipro.ru

import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";

const String SERVER_URL = "127.0.0.1";

Future<HttpServer> findPortAndBind() async {
  HttpServer? server;
  for (int port = 1200; port < 50000; port++) {
    try {
      server = await HttpServer.bind(SERVER_URL, port);
      return server;
    } on SocketException catch (se) {
      print(se);
      // port is already in use
    }
  }
  throw Exception("Unable to find free port");
}

test() async {
  String helloWorld = 'Hello, test world!';
  HttpServer server = await findPortAndBind();
  asyncStart();
  server.listen((HttpRequest request) {
    request.response.write(helloWorld);
    request.response.close();
    server.close();
    asyncEnd();
  });
  HttpClient client = new HttpClient();
  asyncStart();
  client
      .getUrl(Uri.parse("http://$SERVER_URL:${server.port}"))
      .then((HttpClientRequest request) {
    return request.close();
  }).then((HttpClientResponse response) {
    Expect.equals(HttpStatus.ok, response.statusCode);
    response.cast<List<int>>().transform(utf8.decoder).listen((content) {
      Expect.equals(helloWorld, content);
      asyncEnd();
    });
  });
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
