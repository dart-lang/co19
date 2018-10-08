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
 * If port has the value 0 an ephemeral port will be chosen by the system. The
 * actual port used can be retrieved using the port getter.
 * ...
 * @description Checks that if port has the value 0, then an ephemeral port is
 * chosen by the system and the actual port used can be retrieved using the port
 * getter.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

test() async {
  HttpServer server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
  Expect.isTrue(server.port > 0);
  server.close();
  asyncEnd();
}

main() {
  asyncStart();
  test();
}