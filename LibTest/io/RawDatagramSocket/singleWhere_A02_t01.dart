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
 * @description Checks that if en error occurs in test method, the future is
 * completed with this error.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(test, expected, valueExpected, errorExpected) {
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
      Future fValue = bcs.singleWhere(test);
      fValue.then((value) {
        Expect.fail('Future should be completed with error');
      }).catchError((error) {
        Expect.equals(expected, error);
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
  Error error = new Error();
  check((e) => throw 1, 1, true, false);
  check((e) => throw 2, 2, false, true);
  check((e) => throw error, error, true, false);
}
