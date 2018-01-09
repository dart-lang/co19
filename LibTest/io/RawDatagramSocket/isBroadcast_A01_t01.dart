/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isBroadcast
 * Whether this stream is a broadcast stream.
 *
 * @description Checks that the property isBroadcast.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

check(InternetAddress address) {
  asyncStart();
  RawDatagramSocket.bind(address, 0).then((socket) {
    Expect.equals(false, socket.isBroadcast);
    Expect.equals(true, socket.asBroadcastStream().isBroadcast);
    socket.close();
    asyncEnd();
  });
}

main() {
  check(InternetAddress.ANY_IP_V4);
  check(InternetAddress.ANY_IP_V6);
  check(InternetAddress.LOOPBACK_IP_V4);
  check(InternetAddress.LOOPBACK_IP_V6);
}
