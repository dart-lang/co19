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
 * @description Checks that a multi-subscription stream produces the same events
 * as this.
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
      int received = 0;
      int sent = 0;
      int totalSent = 0;
      int nullWriteData = 0;
      int closeEvent = 1;

      var mss = receiver.asBroadcastStream();

      new Timer.periodic(const Duration(microseconds: 1), (timer) {
        totalSent += producer.send([sent], address, receiver.port);
        sent++;
        if (sent > 6) {
          timer.cancel();
          if (totalSent != sent) {
            Expect.fail('$totalSent messages were sent instead of $sent.');
          }
          producer.close();
        }
      });

      mss.listen((event) {
        received++;
        var datagram = receiver.receive();
        if (event == RawSocketEvent.write && datagram == null) {
          nullWriteData = 1;
        }
        if (timer2 != null) {
          timer2.cancel();
        }
        timer2 = new Timer(const Duration(milliseconds: 200), () {
          Expect.isNull(receiver.receive());
          receiver.close();
        });
      }, onDone: () {
        Expect.equals(totalSent + closeEvent + nullWriteData, received);
        asyncEnd();
      });
    });
  });
}

main() {
  check();
  check(true);
}
