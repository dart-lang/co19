/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion NetworkInterface multicastInterface
 * Set or get, the network interface used for outgoing multicast packages.
 *
 * A value of null indicate that the system chooses the network interface to
 * use.
 *
 * By default this value is null
 *
 * @description Checks the multicastInterface property.
 * @issue 17057
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

check(InternetAddress address) {
  asyncStart();
  RawDatagramSocket.bind(address, 0).then((socket) {
    Expect.equals(null, socket.multicastInterface);
    socket.multicastInterface = null;
    Expect.equals(null, socket.multicastInterface);
    socket.close();
    asyncEnd();
  });
}

main() {
  check(InternetAddress.anyIPv4);
  check(InternetAddress.anyIPv6);
  check(InternetAddress.loopbackIPv4);
  check(InternetAddress.loopbackIPv6);
}
