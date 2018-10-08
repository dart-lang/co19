/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future
 * Future<RawSocketEvent> firstWhere (
 *     bool test(T element), {
 *     dynamic defaultValue(),
 *     T orElse()
 * })
 * Finds the first element of this stream matching test.
 * . . .
 * If an error occurs, or if this stream ends without finding a match and with
 * no orElse function provided, the future will receive an error.
 *
 * @description Checks that if an error occurs in [test] method, the future will
 * receive an error.
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
        Expect.fail('Should not be here.');
      }).catchError((e) {
        Expect.equals(expected, e);
      }).whenComplete(() {
        asyncEnd();
      });
    });
  });
}

main() {
  Error error = new Error();
  check((e) => throw 1, 1);
  check((e) => throw 2, 2);
  check((e) => throw error, error);
}
