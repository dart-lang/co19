/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> skip(int count)
 * Skips the first count data events from this stream.
 * . . .
 * For a broadcast stream, the events are only counted from the time the
 * returned stream is listened to.
 *
 * @description Checks that method [skip] skips the first count data events from
 * this stream.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

check(n) {
  asyncStart();
  var address = InternetAddress.LOOPBACK_IP_V4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      int counter = 0;
      List resultList = [];
      List list = [];
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      Stream bcs = receiver.asBroadcastStream();
      Stream s = bcs.skip(n);
      s.listen((event) {
        resultList.add(event);
      }).onDone(() {
        List expected = n > counter ? [] : list.sublist(n);
        Expect.listEquals(expected, resultList);
        asyncEnd();
      });

      bcs.listen((event) {
        list.add(event);
        receiver.receive();
        counter++;
      });

      new Timer(const Duration(milliseconds: 200), () {
        Expect.isNull(receiver.receive());
        receiver.close();
      });
    });
  });
}

main() {
  check(0);
  check(1);
  check(2);
  check(3);
  check(4);
  check(5);
  check(10);
}
