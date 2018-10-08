/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> every(bool test(T element))
 * Checks whether test accepts all elements provided by this stream.
 * . . .
 * If this stream contains an error, or if the call to test throws, the returned
 * future is completed with that error, and processing stops.
 *
 * @description Checks that if [test] throws, the future is completed with that
 * error.
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

      Future<bool> b = receiver.every((e) => throw 1);
      b.then((value) {
        Expect.fail('Should not be here.');
      }).catchError((e) {
        Expect.equals(1, e);
      }).whenComplete(() {
        asyncEnd();
      });
    });
  });
}
