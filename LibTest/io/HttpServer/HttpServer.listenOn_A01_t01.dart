/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion HttpServer.listenOn(ServerSocket serverSocket)
 * Attaches the HTTP server to an existing ServerSocket. When the HttpServer is
 * closed, the HttpServer will just detach itself, closing current connections
 * but not closing serverSocket.
 * @description Checks that this constructor attaches the HTTP server to an
 * existing ServerSocket
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";

test() async {
  String helloWorld = 'Hello, test world!';
  ServerSocket serverSocket =
      await ServerSocket.bind(InternetAddress.loopbackIPv4, 0);
  HttpServer server = new HttpServer.listenOn(serverSocket);

  asyncStart();
  server.listen((HttpRequest request) {
    request.response.write(helloWorld);
    request.response.close();
    server.close();
    asyncEnd();
  });

  var client = new HttpClient();
  var request = await client.getUrl(Uri.parse(
      "http://${InternetAddress.loopbackIPv4.address}:${serverSocket.port}"));
  var response = await request.close();
  Expect.equals(HttpStatus.ok, response.statusCode);

  response.cast<List<int>>().transform(utf8.decoder).listen((content) {
    Expect.equals(helloWorld, content);
    serverSocket.close();
  });
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
