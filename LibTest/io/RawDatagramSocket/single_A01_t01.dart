/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<RawSocketEvent> single
 * The single element of this stream.
 *
 * @description Checks that property single returns the single element of the
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
      Timer  timer2;
      int received = 0;
      var rEvent;

      producer.close();
      receiver.close();

      receiver.single.then((event) {
        received++;
        rEvent = event;
        if (timer2 != null) timer2.cancel();
        timer2 = new Timer(const Duration(milliseconds: 200), () {
          Expect.isNull(receiver.receive());
          if (received != 1) {
            Expect.fail('Number of receiver messages should be equal to 1');
          }
          Expect.equals(RawSocketEvent.closed, rEvent);
          asyncEnd();
        });
      });
    });
  });
}

main() {
  check();
  check(true);
}
