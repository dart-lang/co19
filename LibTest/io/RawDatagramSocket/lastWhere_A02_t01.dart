/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future lastWhere(bool test(T element), {Object defaultValue()})
 * Finds the last element in this stream matching test.
 *
 * As firstWhere, except that the last matching element is found. That means
 * that the result cannot be provided before this stream is done.
 * . . .
 *   If no such element is found before this stream is done, and a defaultValue
 *   function is provided, the result of calling defaultValue becomes the value
 *   of the future.
 *
 * @description Checks that if no such element is found before this stream is
 * done, and a defaultValue function is provided, the result of calling
 * defaultValue becomes the value of the future.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

check(test(e), rValue(), expected) {
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

      Future fValue = receiver.lastWhere(test, defaultValue: rValue);
      fValue.then((value) {
        Expect.equals(expected, value);
      }).catchError((e) {
        print('err: $e');
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
