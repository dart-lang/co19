/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Stream<RawSocketEvent> timeout (
 *     Duration timeLimit, {
 *     void onTimeout(
 *         EventSink<T> sink
 *     )
 * })
 * . . .
 * If a broadcast stream is listened to more than once, each subscription will
 * have its individually timer that starts counting on listen, and the
 * subscriptions' timers can be paused individually.
 *
 * @description Checks that if a broadcast stream is listened to more than once,
 * each subscription will have its individually timer that starts counting on
 * listen.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(dataExpected, errorCountExpected, [bool no_write_events = false]) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      if (no_write_events) {
        receiver.writeEventsEnabled = false;
      }
      int count1 = 0;
      int count2 = 0;
      int sent = 0;
      List list1 = [];
      List list2 = [];
      new Timer.periodic(const Duration(milliseconds: 40), (timer) {
        producer.send([sent], address, receiver.port);
        sent++;
        if (sent > 2) {
          timer.cancel();
          producer.close();
        }
      });

      Stream bcs = receiver.asBroadcastStream();
      Stream s = bcs.timeout(durationMs(1));//,
      s.listen((event) {

        list1.add(event);
        receiver.receive();
      }, onError: (e) {
        Expect.isTrue(e is TimeoutException);
        count1++;
      }, onDone: () {
        Expect.listEquals(dataExpected, list1);
        Expect.equals(errorCountExpected, count1);
      });


      s.listen((event) {
        list2.add(event);
      }, onError: (e) {
        Expect.isTrue(e is TimeoutException);
        count2++;
      }, onDone: () {
        Expect.listEquals(dataExpected, list2);
        Expect.equals(errorCountExpected, count2);
        asyncEnd();
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
    RawSocketEvent.read,
    RawSocketEvent.closed
  ];
  check(expected, 4);
  check(expected.sublist(1), 4, true);
}
