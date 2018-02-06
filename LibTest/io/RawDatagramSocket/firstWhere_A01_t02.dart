/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future firstWhere(bool test(T element), {Object defaultValue()})
 * Finds the first element of this stream matching test.
 *
 * Returns a future that is filled with the first element of this stream that
 * test returns true for.
 *
 * @description Checks that method [firstWhere] returns Future that is filled
 * with the first element of this stream that test returns true for.
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
      int counter = 0;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();

      Stream<RawSocketEvent> bcs = receiver.asBroadcastStream();
      Future fValue = bcs.firstWhere(test);
      fValue.then((value) {
        Expect.equals(expected, value);
      }).whenComplete(() {
        asyncEnd();
      });

      new Timer(const Duration(milliseconds: 200), () {
        Expect.isNull(receiver.receive());
        receiver.close();
      });

      bcs.listen((event) {
        counter++;
        receiver.receive();
      }).onDone(() {
        Expect.equals(4, counter);
      });
    });
  });
}

main() {
  check((e) => e == RawSocketEvent.WRITE, RawSocketEvent.WRITE);
  check((e) => e == RawSocketEvent.READ, RawSocketEvent.READ);
  check((e) => e == RawSocketEvent.CLOSED, RawSocketEvent.CLOSED);
  check((e) => e is RawSocketEvent, RawSocketEvent.WRITE);
  check((e) => true, RawSocketEvent.WRITE);
  check((e) => e != RawSocketEvent.WRITE, RawSocketEvent.READ);
  check((e) => e != RawSocketEvent.WRITE && e != RawSocketEvent.READ,
      RawSocketEvent.CLOSED);
}
