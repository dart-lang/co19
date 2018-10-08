/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion @assertion
 * Future<S> fold<S>(
 *     S initialValue,
 *     S combine(
 *         S previous,
 *         T element
 *     )
 * )
 * Reduces a sequence of values by repeatedly applying combine.
 *
 * @description Checks that method [fold] reduces a sequence of values by
 * repeatedly applying combine.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(initial, convert, expected) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      int counter = 0;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();

      Stream<RawSocketEvent> bcs = receiver.asBroadcastStream();
      Future fValue = bcs.fold(initial, convert);
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
  check(0, (previous, element) => previous + 1, 4);
  check(
      0,
      (previous, element) =>
          previous +
          (element == RawSocketEvent.write
              ? 1
              : (element == RawSocketEvent.read
                  ? 10
                  : (element == RawSocketEvent.closed ? 100 : 0))),
      121);
}
