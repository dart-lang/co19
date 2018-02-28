/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Future<RawSocketEvent> firstWhere (
 *     bool test(T element), {
 *     dynamic defaultValue(),
 *     RawSocketEvent orElse()
 * })
 * Finds the first element of this stream matching test.
 * . . .
 * If no such element is found before this stream is done, and a orElse function
 * is provided, the result of calling orElse becomes the value of the future.
 * If orElse throws, the returned future is completed with that error.
 *
 * @description Checks that if no such element is found before this stream is
 * done, and a orElse function is provided, the result of calling orElse becomes
 * the value of the future.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

check(test, rValue, expected) {
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

      Future fValue = receiver.firstWhere(test, orElse: rValue);
      fValue.then((value) {
        Expect.equals(expected, value);
      }).whenComplete(() {
        asyncEnd();
      });
    });
  });
}

main() {
  check((e) => e == RawSocketEvent.WRITE, () => RawSocketEvent.READ,
      RawSocketEvent.READ);
  check((e) => e == RawSocketEvent.READ, () => RawSocketEvent.READ_CLOSED,
      RawSocketEvent.READ_CLOSED);
  check((e) => e == RawSocketEvent.READ_CLOSED, () => RawSocketEvent.WRITE,
      RawSocketEvent.WRITE);
  check((e) => false, () => RawSocketEvent.READ_CLOSED,
      RawSocketEvent.READ_CLOSED);
}
