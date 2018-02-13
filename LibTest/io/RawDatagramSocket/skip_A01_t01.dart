/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> skip(int count)
 * Skips the first count data events from this stream.
 *
 * @description Checks that method [skip] skips the first count data events from
 * this stream.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

check(n, expected) {
  asyncStart();
  var address = InternetAddress.LOOPBACK_IP_V4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      List list = [];
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();
      receiver.close();

      Stream s = receiver.skip(n);
      s.listen((event) {
        list.add(event);
        receiver.receive();
      }).onDone(() {
        Expect.listEquals(expected, list);
        asyncEnd();
      });
    });
  });
}

main() {
  check(0, [RawSocketEvent.CLOSED]);
  check(1, []);
  check(10, []);
}
