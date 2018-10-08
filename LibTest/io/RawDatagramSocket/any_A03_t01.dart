/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> any(bool test(T element))
 * Checks whether test accepts any element provided by this stream.
 * . . .
 * If this stream contains an error, or if the call to test throws, the returned
 * future is completed with that error, and processing stops.
 *
 * @description Checks that if the call to test throws, the returned future is
 * completed with that error, and processing stops.
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
      int sent = 0;
      int count = 0;

      new Timer.periodic(const Duration(microseconds: 1), (timer) {
        producer.send([sent], address, receiver.port);
        sent++;
        if (sent > 3) {
          timer.cancel();
          producer.close();
          receiver.close();
        }
      });

      bool test(RawSocketEvent x) {
        count++;
        if (x == RawSocketEvent.read) {
          throw 11;
        }
        var d = receiver == null ? null : receiver.receive();
        if (d == null) {
          return true;
        } else {
          return false;
        }
      }

      receiver.any((event) => test(event)).then((value) {
        Expect.fail('Should completed with throw.');
      }).catchError((error) {
        Expect.equals(11, error);
        if (no_write_events) {
          Expect.equals(1, count);
        } else {
          Expect.equals(2, count);
        }
      }).whenComplete(() {
        asyncEnd();
      });
    });
  });
}

main() {
  check();
  check(true);
}
