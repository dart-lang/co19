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
 * @description Checks that method any returns true when RawSocketEvent.read is
 * searched and in this case the listening to the stream is stopped after the
 * first received RawSocketEvent.read event.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

check([bool no_write_events = false]) {
  var expectedEvent = RawSocketEvent.read;
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      if (no_write_events) {
        receiver.writeEventsEnabled = false;
      }
      receiver.writeEventsEnabled = false;
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

      bool test(x) {
        count++;
        return x == expectedEvent;
      }

      receiver.any((event) => test(event)).then((value) {
        Expect.equals(true, value);
        if (receiver.writeEventsEnabled) {
          Expect.equals(2, count);
        } else {
          Expect.equals(1, count);
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
