/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Future<RawSocketEvent> singleWhere (
 *     bool test(T element), {
 *     T orElse()
 * })
 * Finds the single element in this stream matching test.
 *
 * Like lastWhere, except that it is an error if more than one matching element
 * occurs in the stream.
 *
 * @description Checks that no one element is found in this stream matching the
 * test and orElse function is provided, the returns future is completed with
 * the result of orElse function call.
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
      int counter = 0;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();

      Stream<RawSocketEvent> bcs = receiver.asBroadcastStream();
      Future fValue =
          bcs.singleWhere(test, orElse: () => RawSocketEvent.readClosed);
      fValue.then((value) {
        Expect.equals(expected, value);
      }).catchError((error) {
        Expect.fail('Future should be completed with event');
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
  check((e) => e == RawSocketEvent.readClosed, RawSocketEvent.readClosed);
  check((e) => false, RawSocketEvent.readClosed);
  check((e) => !(e is RawSocketEvent), RawSocketEvent.readClosed);
}
