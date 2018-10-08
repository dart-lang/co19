/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool multicastLoopback
 * Set or get, whether multicast traffic is looped back to the host.
 *
 * By default multicast loopback is enabled.
 *
 * @description Checks that multicastLoopback property may be get and set for
 * the RawDatagramSocket instance with an internet address used in a host
 * parameter of bind method.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

check(InternetAddress address) {
  asyncStart();
  RawDatagramSocket.bind(address, 0).then((socket) {
    Expect.isTrue(socket.multicastLoopback);
    socket.multicastLoopback = false;
    Expect.isFalse(socket.multicastLoopback);
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
