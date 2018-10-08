/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool writeEventsEnabled
 * Set or get, if the RawDatagramSocket should listen for RawSocketEvent.write
 * events. Default is true. This is a one-shot listener, and writeEventsEnabled
 * must be set to true again to receive another write event.
 *
 * @description Checks that writeEventsEnabled property may be get and set for
 * the RawDatagramSocket instance and that default value is true.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(InternetAddress address) {
  asyncStart();
  RawDatagramSocket.bind(address, 0).then((socket) {
    Expect.equals(true, socket.writeEventsEnabled);
    socket.writeEventsEnabled = false;
    Expect.equals(false, socket.writeEventsEnabled);
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
