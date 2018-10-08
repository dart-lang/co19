/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int multicastHops
 * Set or get, the maximum network hops for multicast packages originating from
 * this socket.
 *
 * For IPv4 this is referred to as TTL (time to live).
 *
 * By default this value is 1 causing multicast traffic to stay on the local
 * network.
 *
 * @description Checks that multicastHops value by default is 1.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

check(InternetAddress address) {
  asyncStart();
  RawDatagramSocket.bind(address, 0).then((socket) {
    var v1 = socket.multicastHops;
    Expect.equals(1, v1);
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
