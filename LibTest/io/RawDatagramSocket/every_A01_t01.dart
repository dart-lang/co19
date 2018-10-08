/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> every(bool test(T element))
 * Checks whether test accepts all elements provided by this stream.
 *
 * Calls test on each element of the stream. If the call returns false, the
 * returned future is completed with false and processing stops.
 *
 * If the stream ends without finding an element that test rejects, the returned
 * future is completed with true.
 *
 * @description Checks that [test] accepts the single element provided by this
 * RawDatagramSocket, and if the call returns false, the returned future is
 * completed with false, otherwise the returned future is completed with true.
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
      receiver.close();

      Future<bool> b = receiver.every(test);
      b.then((value) {
        Expect.equals(expected, value);
        asyncEnd();
      });
    });
  });
}

main() {
  check((e) => e == RawSocketEvent.write, false);
  check((e) => e == RawSocketEvent.read, false);
  check((e) => e == RawSocketEvent.closed, true);
  check((e) => e == RawSocketEvent.readClosed, false);
}
