/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<RawSocketEvent> single
 * Returns the single element.
 * . . .
 * If this is empty or has more than one element throws a StateError.
 *
 * @description Checks that if this has more than one element a StateError is
 * thrown.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

check([bool no_write_events = false]) {
  asyncStart();
  var address = InternetAddress.LOOPBACK_IP_V4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      if (no_write_events) {
        receiver.writeEventsEnabled = false;
      }
      Timer timer2;
      int sent = 0;
      bool stError = false;

      new Timer.periodic(const Duration(microseconds: 1), (timer) {
        if (sent == 1) {
          timer.cancel();
          producer.close();
          receiver.close();
        } else {
          producer.send([sent], address, receiver.port);
          sent++;
        }
      });

      void action() {
        Expect.isTrue(stError);
        asyncEnd();
      }

      receiver.single.then((event) {
        if (timer2 != null) timer2.cancel();
        timer2 = new Timer(const Duration(milliseconds: 200), () {
          Expect.isNull(receiver.receive());
        });
      }, onError: (error) {
        Expect.isTrue(error is StateError);
        stError = true;
      }).whenComplete(action);
    });
  });
}

main() {
  check();
  check(true);
}
