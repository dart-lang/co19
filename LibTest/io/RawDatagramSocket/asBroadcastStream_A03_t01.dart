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
 * . . .
 * If onCancel is provided, it is called in a similar way to onListen when the
 * returned stream stops having listener. If it later gets a new listener, the
 * onListen function is called again.
 *
 * @description Checks that if onCancel is provided, it is called in a similar
 * way to onListen when the returned stream stops having listener.
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
      Timer timer1;
      Timer timer2;
      int received1 = 0;
      int sent = 0;
      int cancel = 0;
      bool anySubscribers = true;
      StreamSubscription ss1;
      StreamSubscription ss2;

      void onCancel(StreamSubscription<RawSocketEvent> subs) {
        cancel++;
        if (cancel == 2) {
          timer1.cancel();
        }
      }

      var s = receiver.asBroadcastStream(onCancel: onCancel);

      new Timer.periodic(const Duration(microseconds: 1), (timer) {
        producer.send([sent], address, receiver.port);
        sent++;
        if (sent > 10) {
          timer.cancel();
          producer.close();
        }
      });

      Expect.equals(0, cancel);

      ss1 = s.listen((event) {
        received1++;
        receiver.receive();
        if (received1 == 3) {
          ss1.cancel();
          anySubscribers = false;
        }
      });

      addSubscribers(_) {
        if (!anySubscribers) {
          anySubscribers = true;
          ss2 = s.listen((event) {
            Expect.equals(1, cancel);
            receiver.receive();
            if (timer2 != null) timer2.cancel();
            timer2 = new Timer(const Duration(milliseconds: 200), () {
              Expect.isNull(receiver.receive());
              Expect.equals(11, sent);
              ss2.cancel();
              receiver.close();
              Expect.equals(2, cancel);
              asyncEnd();
            });
          });
        }
      }

      timer1 = new Timer.periodic(durationMs(1), addSubscribers);
    });
  });
}

main() {
  check();
  check(true);
}
