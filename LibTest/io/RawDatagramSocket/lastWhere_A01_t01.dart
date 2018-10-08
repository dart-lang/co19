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
 *
 * @description Checks that method [lastWhere] returns Future that is completed
 * with the last element of this stream that test returns true for.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();
      receiver.close();

      Future fValue = receiver.lastWhere((e) => e == RawSocketEvent.closed);
      fValue.then((value) {
        Expect.equals(RawSocketEvent.closed, value);
      }).whenComplete(() {
        asyncEnd();
      });
    });
  });
}
