/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<RawSocketEvent> skipWhile(bool test(T element))
 * Skip data events from this stream while they are matched by test.
 * . . .
 * For a broadcast stream, the events are only tested from the time the returned
 * stream is listened to.
 *
 * @description Checks that for a broadcast stream, the events are tested from
 * the time the returned stream is listened to.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(test(e), expected, testCallExpected) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      int counter = 0;
      int testCall = 0;
      List list = [];
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      Stream bcs = receiver.asBroadcastStream();

      Stream s = bcs.skipWhile((e) {
        testCall++;
        return test(e);
      });
      s.listen((event) {
        list.add(event);
      }, onDone: () {
        Expect.equals(testCallExpected, testCall);
        Expect.listEquals(expected, list);
        asyncEnd();
      });

      bcs.listen((event) {
        receiver.receive();
        counter++;
      }).onDone(() {
        Expect.equals(4, counter);
      });

      new Timer(const Duration(milliseconds: 200), () {
        Expect.isNull(receiver.receive());
        receiver.close();
      });
    });
  });
}

main() {
  List expected = [
    RawSocketEvent.write,
    RawSocketEvent.read,
    RawSocketEvent.read,
    RawSocketEvent.closed
  ];
  check((e) => e == RawSocketEvent.write, expected.sublist(1), 2);
  check((e) => e != RawSocketEvent.read, expected.sublist(1), 2);
  check((e) => e != RawSocketEvent.closed, expected.sublist(3), 4);
  check((e) => true, [], 4);
  check((e) => false, expected, 1);
}
