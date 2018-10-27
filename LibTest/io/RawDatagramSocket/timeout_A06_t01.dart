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
      int totalSent = 0;

      new Timer.periodic(const Duration(milliseconds: 40), (timer) {
        totalSent += producer.send([sent], address, receiver.port);
        sent++;
        if (sent > 2) {
          timer.cancel();
          if (totalSent != sent) {
            Expect.fail('$totalSent messages were sent instead of $sent.');
          }
          producer.close();
        }
      });

      Stream bcs = receiver.asBroadcastStream();
      Stream s = bcs.timeout(durationMs(1));
      s.listen((event) {
        list1.add(event);
        receiver.receive();
      }, onError: (e) {
        Expect.isTrue(e is TimeoutException);
        count1++;
      }, onDone: () {
      });

      Timer timer;
      s.listen((event) {
        list2.add(event);
        if (timer != null) {
          timer.cancel();
        }
        timer = new Timer(const Duration(milliseconds: 200), () {
          Expect.isNull(receiver.receive());
          receiver.close();
        });
      }, onError: (e) {
        Expect.isTrue(e is TimeoutException);
        count2++;
      }, onDone: () {
        if (timer != null) {
          timer.cancel();
        }
        print('$no_write_events  $count1 $count2  $list1 $list2');
        Expect.equals(count1, count2);
        Expect.deepEquals(list1, list2);
        asyncEnd();
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
