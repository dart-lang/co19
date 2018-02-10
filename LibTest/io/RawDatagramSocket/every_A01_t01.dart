/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> every(bool test(T element))
 * Checks whether test accepts all elements provided by this stream.
 *
 * Completes the Future when the answer is known.
 *
 * @description Checks whether [test] accepts all elements provided by this
 * RawDatagramSocket.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

check(test, expected) {
  asyncStart();
  var address = InternetAddress.LOOPBACK_IP_V4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();
      receiver.close();

      Future<bool> b = receiver.every(test);
      b.then((value) {
        Expect.equals(expected, value);
        asyncEnd();
      });
    });
  });
}

main() {
  check((e) => e == RawSocketEvent.WRITE, false);
  check((e) => e == RawSocketEvent.READ, false);
  check((e) => e == RawSocketEvent.CLOSED, true);
  check((e) => e == RawSocketEvent.READ_CLOSED, false);
}
