/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> any(bool test(T element))
 * Checks whether test accepts any element provided by this stream.
 *
 * Calls test on each element of the stream. If the call returns true, the
 * returned future is completed with true and processing stops.
 *
 * @description Checks whether test accepts any element provided by this stream
 * and stops listening to the stream after the first matching element has been
 * found.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

check(int expectedValue, [bool no_write_events = false]) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      if (no_write_events) {
        receiver.writeEventsEnabled = false;
      }
      int sent = 0;
      int count = 0;
      int nullWriteData = 0;

      new Timer.periodic(const Duration(microseconds: 1), (timer) {
        producer.send([sent], address, receiver.port);
        sent++;
        if (sent > 3) {
          timer.cancel();
          producer.close();
        }
      });

      bool test(RawSocketEvent x) {
        count++;
        var d = receiver == null ? null : receiver.receive();
        if (d != null) {
          return d.data[0] == expectedValue;
        } else {
          if (x == RawSocketEvent.write) {
            nullWriteData = 1;
          }
          return false;
        }
      }

      Timer commonTimer;
      receiver.any((event) => test(event)).then((value) {
        Expect.equals(true, value);
        Expect.equals(expectedValue, count - 1 - nullWriteData);
      }).whenComplete(() {
        commonTimer.cancel();
        receiver.close();
        asyncEnd();
      });

      commonTimer = new Timer(const Duration(seconds: 1), () {
        receiver.close();
        Expect.fail('Test failed as it was executed more then 1 second.');
      });
    });
  });
}

main() {
  for (int i = 0; i < 4; i++) {
    check(i);
    check(i, true);
  }
}
