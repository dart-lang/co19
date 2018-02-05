/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> contains(Object needle)
 * Checks whether needle occurs in the elements provided by this stream.
 *
 * Completes the Future when the answer is known. If this stream reports an
 * error, the Future will report that error.
 *
 * @description Checks whether needle occurs in the elements provided by this
 * RawDatagramSocket.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

check(value, expected) {
  asyncStart();
  var address = InternetAddress.LOOPBACK_IP_V4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      int counter = 0;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();

      Stream<RawSocketEvent> stream = receiver.asBroadcastStream();
      Future<bool> b = stream.contains(value);
      b.then((e) {
        Expect.equals(expected, e);
      });

      new Timer(const Duration(milliseconds: 200), () {
        Expect.isNull(receiver.receive());
        receiver.close();
      });

      stream.listen((event) {
        counter++;
        receiver.receive();
      }).onDone(() {
        Expect.equals(4, counter);
        asyncEnd();
      });
    });
  });
}

main() {
  check(RawSocketEvent.WRITE, true);
  check(RawSocketEvent.READ, true);
  check(RawSocketEvent.CLOSED, true);
  check(RawSocketEvent.READ_CLOSED, false);
}
