/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int port
 * Returns the port used by this socket.
 *
 * @description Checks that port property returns the port used by this socket
 * and different sockets on the same host have different port.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

check(InternetAddress address) {
  asyncStart();
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      Expect.notEquals(producer.port, receiver.port);
      receiver.close();
      producer.close();
      asyncEnd();
    });
  });
}

main() {
  check(InternetAddress.ANY_IP_V4);
  check(InternetAddress.ANY_IP_V6);
  check(InternetAddress.LOOPBACK_IP_V4);
  check(InternetAddress.LOOPBACK_IP_V6);
}
