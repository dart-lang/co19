/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<Socket> detachSocket()
 * Detach the underlying socket from the HTTP client. When the socket is
 * detached the HTTP client will no longer perform any operations on it.
 *
 * This is normally used when a HTTP upgrade is negotiated and the communication
 * should continue with a different protocol.
 * @description Checks that this method detaches the underlying socket from the
 * HTTP client
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4.address;

test(String method) async {
  asyncStart();
  HttpServer server = await HttpServer.bind(localhost, 0);
  int port = server.port;
  server.listen((HttpRequest request) {
    request.response.close();
    server.close();
  });

  HttpClient client = new HttpClient();
  client.open(method, localhost, server.port, "")
      .then((HttpClientRequest request) {
    return request.close();
  }).then((HttpClientResponse response) {
    response.cast<List<int>>().transform(utf8.decoder).listen((content) {

    });
    response.detachSocket().then((Socket socket) {
      Expect.notEquals(port, socket.port);
      asyncEnd();
    });
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
