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
 * The optional argument shared specifies whether additional HttpServer objects
 * can bind to the same combination of address, port and v6Only. If shared is
 * true and more HttpServers from this isolate or other isolates are bound to
 * the port, then the incoming connections will be distributed among all the
 * bound HttpServers. Connections can be distributed over multiple isolates this
 * way.
 * @description Checks that if [shared] is true then HttpServer objects with
 * the same combination of address, port and v6Only can bind
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

test() async {
  asyncStart();
  HttpServer server1 = null;
  HttpServer server2 = null;
  try {
    server1 = await HttpServer.bind(InternetAddress.loopbackIPv4, 1234,
        shared: true);
    server2 = await HttpServer.bind(InternetAddress.loopbackIPv4, 1234,
        shared: true);
  } finally {
    server1.close();
    server2.close();
    asyncEnd();
  }
}

main() {
  test();
}