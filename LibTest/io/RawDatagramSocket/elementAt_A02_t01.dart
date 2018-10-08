/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<RawSocketEvent> elementAt(int index)
 * Returns the value of the indexth data event of this stream.
 * . .  .
 * If a done event occurs before the value is found, the future completes with
 * a RangeError.
 *
 * @description Checks that if a done event occurs before the value is found,
 * the future completes with a RangeError.
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
      producer.send([sent++], address, receiver.port);
      producer.close();
      receiver.close();

      Future fValue = receiver.elementAt(1);
      fValue.then((value) {print(value);
        Expect.fail('RangeError should be reported.');
      }).catchError((e) {
        Expect.isTrue(e is RangeError);
      }).whenComplete(() {
        asyncEnd();
      });
    });
  });
}
