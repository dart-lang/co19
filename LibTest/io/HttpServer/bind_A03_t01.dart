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
/// ...
/// If an IP version 6 (IPv6) address is used, both IP version 6 (IPv6) and
/// version 4 (IPv4) connections will be accepted. To restrict this to version 6
/// (IPv6) only, use v6Only to set version 6 only.
/// However, if the address is InternetAddress.loopbackIPv6, only IP version 6 
/// (IPv6) connections will be accepted.
/// @description Checks that if the address is InternetAddress.loopbackIPv6, then 
/// IP version 4 (IPv4) connections are not accepted
/// @author sgrekhov@unipro.ru
/// @issue 31111

import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";

test() async {
  String helloWorld = 'Hello, test world!';
  HttpServer server = await HttpServer.bind(InternetAddress.loopbackIPv6, 0);

  server.listen((HttpRequest request) {
    request.response.write(helloWorld);
    request.response.close();
    server.close();
  });

  asyncStart();
  HttpClient client = new HttpClient();
  var req = client.getUrl(Uri.parse(
          "http://${InternetAddress.loopbackIPv4.address}:${server.port}"));
  req.then((HttpClientRequest request) {
    Expect.fail("Connection must not be accepted");
  }, onError: (e) {
    server.close();
    asyncEnd();
  });
}

main() {
  test();
}
