/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<RawSocketEvent> skip(int count)
 * Skips the first count data events from this stream.
 *
 * Returns a stream that emits the same events as this stream would if listened
 * to at the same time, except that the first count data events are not emitted.
 * The returned stream is done when this stream is.
 *
 * If this stream emits fewer than count data events before being done, the
 * returned stream emits no data events.
 *
 * @description Checks that method [skip] skips the first count data events from
 * this stream, and if this stream emits fewer than count data events before
 * being done, the returned stream emits no data events.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(n) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
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
