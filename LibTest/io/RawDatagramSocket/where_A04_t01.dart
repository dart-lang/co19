/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<RawSocketEvent> where (bool test(T event))
 * . . .
 * If a broadcast stream is listened to more than once, each subscription will
 * individually perform the test.
 *
 * @description Checks that if a broadcast stream is listened to more than once,
 * each subscription will individually perform the test.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

check(test(e), dataExpected) {
  asyncStart();
  var address = InternetAddress.LOOPBACK_IP_V4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      List list1 = [];
      List list2 = [];
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      Stream bcs = receiver.asBroadcastStream();
      Stream s = bcs.where(test);
      s.listen((event) {
        list1.add(event);
      }, onDone: () {
        Expect.listEquals(dataExpected, list1);
      });
      s.listen((event) {
        list2.add(event);
      }, onDone: () {
        Expect.listEquals(dataExpected, list2);
        asyncEnd();
      });

      bcs.listen((event) {
        receiver.receive();
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
    RawSocketEvent.WRITE,
    RawSocketEvent.READ,
    RawSocketEvent.READ,
    RawSocketEvent.CLOSED
  ];
  check((e) => e != RawSocketEvent.CLOSED, expected.sublist(0, 3));
  check((e) => e != RawSocketEvent.READ,
      [RawSocketEvent.WRITE, RawSocketEvent.CLOSED]);
  check((e) => e != RawSocketEvent.WRITE, expected.sublist(1));
  check((e) => e == RawSocketEvent.CLOSED, expected.sublist(3));
  check((e) => e == RawSocketEvent.READ, expected.sublist(1, 3));
  check((e) => e == RawSocketEvent.WRITE, expected.sublist(0, 1));
  check((e) => true, expected);
  check((e) => false, []);
}
