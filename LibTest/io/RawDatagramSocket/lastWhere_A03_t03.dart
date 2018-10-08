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
 *   If an error occurs, or if this stream ends without finding a match and with
 *   no orError function provided, the future will receive an error.
 *
 * @description Checks that if this stream ends without finding a match and with
 * no orElse function provided, the future will receive an error.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(test) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();

      Stream<RawSocketEvent> bcs = receiver.asBroadcastStream();
      Future fValue = bcs.lastWhere(test);
      fValue.then((value) {
        Expect.fail('Should not be here.');
      }).catchError((e) {
        Expect.isTrue(e is StateError);
      }).whenComplete(() {
        asyncEnd();
      });

      new Timer(const Duration(milliseconds: 200), () {
        Expect.isNull(receiver.receive());
        receiver.close();
      });

      bcs.listen((event) {
        receiver.receive();
      });
    });
  });
}

main() {
  check((e) => e == null);
  check((e) => e == 1);
  check((e) => !(e is RawSocketEvent));
  check((e) => false);
}
