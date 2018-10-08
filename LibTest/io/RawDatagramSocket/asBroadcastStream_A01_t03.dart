/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Stream<RawSocketEvent> asBroadcastStream({
 *     void onListen(StreamSubscription<T> subscription),
 *     void onCancel(StreamSubscription<T> subscription)
 * })
 * Returns a multi-subscription stream that produces the same events as this.
 *
 * The returned stream will subscribe to this stream when its first subscriber
 * is added, and will stay subscribed until this stream ends, or a callback
 * cancels the subscription.
 *
 * @description Checks that a returned stream will subscribe to this stream when
 * its first subscriber is added, and will stay subscribed until a callback
 * cancels the subscription.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

check([bool no_write_events = false]) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      if (no_write_events) {
        receiver.writeEventsEnabled = false;
      }
      Timer timer2;
      int received1 = 0;
      int received2 = 0;
      int sent = 0;

      var mss = receiver.asBroadcastStream();

      new Timer.periodic(const Duration(microseconds: 1), (timer) {
        producer.send([sent], address, receiver.port);
        sent++;
        if (sent > 6) {
          timer.cancel();
          producer.close();
        }
      });

      StreamSubscription ss;
      ss = mss.listen((event) {
        received1++;
        var datagram = receiver.receive();
        if (datagram != null) {
          Expect.isTrue(sent >= received1);
        }
        if (received1 == 3) {
          ss.cancel();
        }
      });

      mss.listen((event) {
        received2++;
        var datagram = receiver.receive();
        if (datagram != null) {
          Expect.equals(sent, received2);
          Expect.equals(sent - 1, datagram.data[0]);
        }
        if (timer2 != null) timer2.cancel();
        timer2 = new Timer(const Duration(milliseconds: 200), () {
          Expect.isNull(receiver.receive());
          receiver.close();
        });
      }, onDone: () {
        Expect.equals(7, sent);
        Expect.equals(3, received1);
        Expect.isTrue(8 >= received2);
        asyncEnd();
      });
    });
  });
}

main() {
  check();
  check(true);
}
