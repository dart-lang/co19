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
      int counter = 0;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();

      Stream<RawSocketEvent> bcs = receiver.asBroadcastStream();
      Future fValue = bcs.firstWhere(test);
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
        counter++;
        receiver.receive();
      }).onDone(() {
        Expect.equals(4, counter);
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
