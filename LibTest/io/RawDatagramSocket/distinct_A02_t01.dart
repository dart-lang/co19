/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<RawSocketEvent> distinct([bool equals(T previous, T next)])
 * Skips data events if they are equal to the previous data event.
 * . . .
 * The returned stream is a broadcast stream if this stream is. If a broadcast
 * stream is listened to more than once, each subscription will individually
 * perform the equals test.
 *
 * @description Checks that the returned stream is a broadcast stream if this
 * stream is, and if a broadcast stream is listened to more than once, each
 * subscription will individually perform the equals test.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  List expected = [
    RawSocketEvent.write,
    RawSocketEvent.read,
    RawSocketEvent.closed
  ];
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      int counter1 = 0;
      int counter2 = 0;
      int counter3 = 0;
      var received = 0;
      Timer timer;
      List list1 = [];
      List list2 = [];
      List list3 = [];

      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      Stream bcs = receiver.asBroadcastStream();
      Expect.isTrue(bcs.isBroadcast);
      Stream s = bcs.distinct((previous, next) => previous == next);
      Expect.isTrue(s.isBroadcast);
      s.listen((event) {
        list1.add(event);
        counter1++;
      }, onDone: () {
        Expect.equals(3, counter1);
        Expect.listEquals(expected, list1);
      });

      s.listen((event) {
        list2.add(event);
        counter2++;
      }, onDone: () {
        Expect.equals(3, counter2);
        Expect.listEquals(expected, list2);
      });

      s.listen((event) {
        list3.add(event);
        counter3++;
      }, onDone: () {
        Expect.equals(3, counter3);
        Expect.listEquals(expected, list3);
      });

      bcs.listen((event) {
        receiver.receive();
        received++;
        if (timer != null) {
          timer.cancel();
        }
        timer = new Timer(const Duration(milliseconds: 200), () {
          Expect.isNull(receiver.receive());
          receiver.close();
          if (received == 4) {
            asyncEnd();
          }
        });
      });
    });
  });
}
