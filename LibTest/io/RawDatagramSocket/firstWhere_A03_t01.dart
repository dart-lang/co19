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
 * Stops listening to the stream after the first matching element has been
 * received.
 *
 * Internally the method cancels its subscription after the first element that
 * matches the predicate. This means that single-subscription (non-broadcast)
 * streams are closed and cannot be reused after a call to this method.
 *
 * @description Checks that the method cancels its subscription after the first
 * element that matches the predicate, and single-subscription (non-broadcast)
 * streams are closed and cannot be reused after a call to this method.
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

      Future fValue = receiver.firstWhere((e) => true);
      fValue.then((value) {
        Expect.equals(RawSocketEvent.write, value);
      }).whenComplete(() {
        Expect.throws(() => receiver.listen((e) {
              print(e);
            }));
        asyncEnd();
      });
    });
  });
}
