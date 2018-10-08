/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future forEach(void action(T element))
 * Executes action on each data event of the stream.
 * . . .
 * Completes the future with an error if the stream has an error event, or if
 * action throws.
 *
 * @description Checks that the returned Future is completed with an error if
 * action throws.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(variant) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      void action1(e) => throw 1;
      void action2(e) => e == RawSocketEvent.closed ? throw 2 : 0;
      var action = variant == 1 ? action1 : action2;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();
      receiver.close();

      receiver.forEach(action).then((_) {
        Expect.fail('Should not be here');
      }).catchError((e) {
        Expect.equals(variant, e);
      }).whenComplete(() {
        asyncEnd();
      });
    });
  });
}

main() {
  check(1);
  check(2);
}
