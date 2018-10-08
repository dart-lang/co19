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
      Future fValue = bcs.firstWhere(test, orElse: rValue);
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
