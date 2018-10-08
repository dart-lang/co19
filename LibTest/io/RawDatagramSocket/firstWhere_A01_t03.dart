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
 *
 * Returns a future that is completed with the first element of this stream that
 * test returns true for.
 *
 * @description Checks that method [firstWhere] returns Future that is completed
 * with the first element of this stream that test returns true for.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(test, expected) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();

      Future fValue = receiver.firstWhere(test);
      fValue.then((value) {
        Expect.equals(expected, value);
      }).whenComplete(() {
        asyncEnd();
      });
    });
  });
}

main() {
  check((e) => e == RawSocketEvent.write, RawSocketEvent.write);
  check((e) => e == RawSocketEvent.read, RawSocketEvent.read);
  check((e) => e is RawSocketEvent, RawSocketEvent.write);
  check((e) => true, RawSocketEvent.write);
  check((e) => e != RawSocketEvent.write, RawSocketEvent.read);
}
