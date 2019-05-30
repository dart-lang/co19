/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<HttpServer> bind(
 *  address,
 *  int port, {
 *  int backlog: 0,
 *  bool v6Only: false,
 *  bool shared: false
 * }).
 * ...
 * If an IP version 6 (IPv6) address is used, both IP version 6 (IPv6) and
 * version 4 (IPv4) connections will be accepted. To restrict this to version 6
 * (IPv6) only, use v6Only to set version 6 only.
 * @description Checks that if v6Only is set to true, then only IPv6 connections
 * accepted
 * @author sgrekhov@unipro.ru
 * @issue 31111
 */
import "dart:io";
import "../../../Utils/expect.dart";

test() async {
  HttpServer server =
      await HttpServer.bind(InternetAddress.loopbackIPv6, 0, v6Only: true);

  server.listen((HttpRequest request) {
    server.close();
    Expect.fail("Request shouldn't be processed");
  });

  HttpClient client = new HttpClient();
  client.getUrl(
      Uri.parse("http://${InternetAddress.loopbackIPv4.address}:${server.port}"))
      .then((HttpClientRequest request) {
    return request.close();
  }).then((HttpClientResponse response) {
    Expect.fail("No response expected");
  }).catchError((e) {
    try {
      Expect.isTrue(e is SocketException);
    } finally {
      server.close();
      asyncEnd();
    }
  });
}

main() {
  asyncStart();
  test();
}