/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<RawSocketEvent> first
 * The first element of the stream.
 *
 * Stops listening to the stream after the first element has been received.
 *
 * Internally the method cancels its subscription after the first element.
 * This means that single-subscription (non-broadcast) streams are closed and
 * cannot be reused after a call to this getter.
 *
 * @description Checks that property first returns the first element of the
 * stream and stops listening to the stream after the first element has been
 * received.
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
      int sent = 0;
      bool completed = false;
      int received = 0;
      new Timer.periodic(const Duration(microseconds: 1), (timer) {
        if (sent == 10 || completed) {
          timer.cancel();
          producer.close();
        } else {
          producer.send([sent++], address, receiver.port);
        }
      });

      void action() {
        completed = true;
        receiver.close();
        asyncEnd();
      }

      receiver.first.then((event) {
        received++;
        Expect.equals(
            no_write_events ? RawSocketEvent.read : RawSocketEvent.write,
            event);
        if (timer2 != null) timer2.cancel();
        timer2 = new Timer(const Duration(milliseconds: 200), () {
          Expect.isNull(receiver.receive());
          if (received != 1) {
            Expect.fail('Number of receiver messages should be equal to 1');
          }
        });
      }).whenComplete(action);
    });
  });
}

main() {
  check();
  check(true);
}
