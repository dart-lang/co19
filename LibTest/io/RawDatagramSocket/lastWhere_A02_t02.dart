/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Future<T> lastWhere (
 *     bool test(T element), {
 *     dynamic defaultValue(),
 *     T orElse()
 * })
 * Finds the last element in this stream matching test.
 *
 * As firstWhere, except that the last matching element is found. That means
 * that the result cannot be provided before this stream is done.
 * . . .
 *   If no such element is found before this stream is done, and a orElse
 *   function is provided, the result of calling orElse becomes the value
 *   of the future.
 *
 * @description Checks that if no such element is found before this stream is
 * done, and a orElse function is provided, the result of calling orElse becomes
 * the value of the future.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(test, rValue, expected) {
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
      Future fValue = bcs.lastWhere(test, orElse: rValue);
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
  check((e) => e == null, () => RawSocketEvent.readClosed,
      RawSocketEvent.readClosed);
  check((e) => e == 1, () => RawSocketEvent.read, RawSocketEvent.read);
  check((e) => !(e is RawSocketEvent), () => RawSocketEvent.closed,
      RawSocketEvent.closed);
  check((e) => false, () => RawSocketEvent.write, RawSocketEvent.write);
}
