/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool readEventsEnabled
 * Set or get, if the RawDatagramSocket should listen for RawSocketEvent.read
 * events. Default is true.
 *
 * @description Checks that readEventsEnabled property may be get and set for
 * the RawDatagramSocket instance and the default value is true.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

check(InternetAddress address) {
  asyncStart();
  RawDatagramSocket.bind(address, 0).then((socket) {
    Expect.equals(true, socket.readEventsEnabled);
    socket.readEventsEnabled = false;
    Expect.equals(false, socket.readEventsEnabled);
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
