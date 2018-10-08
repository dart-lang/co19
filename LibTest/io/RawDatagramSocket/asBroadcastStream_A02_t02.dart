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
 * If onListen is provided, it is called with a subscription-like object that
 * represents the underlying subscription to this stream. It is possible to
 * pause, resume or cancel the subscription during the call to onListen.
 * It is not possible to change the event handlers, including using
 * StreamSubscription.asFuture.
 *
 * @description Checks that if onListen is provided, it is called with a
 * subscription-like object that represents the underlying subscription to this
 * stream.
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
      int listen = 0;
      bool anySubscribers = true;
      StreamSubscription ss1;
      StreamSubscription ss2;

      void onListen(StreamSubscription<RawSocketEvent> subs) {
        listen++;
        if (listen == 2) {
          timer1.cancel();
        }
      }

      var s = receiver.asBroadcastStream(onListen: onListen);

      new Timer.periodic(const Duration(microseconds: 1), (timer) {
        producer.send([sent], address, receiver.port);
        sent++;
        if (sent > 10) {
          timer.cancel();
          producer.close();
        }
      });

      Expect.equals(0, listen);

      ss1 = s.listen((event) {
        Expect.equals(1, listen);
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
            Expect.equals(2, listen);
            receiver.receive();
            if (timer2 != null) timer2.cancel();
            timer2 = new Timer(const Duration(milliseconds: 200), () {
              Expect.isNull(receiver.receive());
              Expect.equals(11, sent);
              ss2.cancel();
              receiver.close();
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
