/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<String> supportedProtocols
 * final
 *
 * @description Checks that property supportedProtocols returns the List<String>
 * that was set to corresponding parameter of bind method.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

check(InternetAddress address) {
  asyncStart();
  List<String> protocols = ["http/1.1", "h2"];
  SecurityContext sc = new SecurityContext(withTrustedRoots: true);
  RawSecureServerSocket
      .bind(address, 0, sc, supportedProtocols: protocols)
      .then((server) {
    List<String> list = server.supportedProtocols;
    Expect.listEquals(protocols, list);
    server.close();
    asyncEnd();
  });
}

main() {
  check(InternetAddress.anyIPv4);
  check(InternetAddress.anyIPv6);
  check(InternetAddress.loopbackIPv4);
  check(InternetAddress.loopbackIPv6);
}
