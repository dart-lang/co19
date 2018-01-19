/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> any(bool test(T element))
 * Checks whether test accepts any element provided by this stream.
 *
 * Completes the Future when the answer is known.
 *
 * If this stream reports an error, the Future reports that error.
 *
 * Stops listening to the stream after the first matching element has been
 * found.
 *
 * @description Checks that method any returns false when writeEventsEnabled is
 * false and RawSocketEvent.READ_CLOSED is searched. In this case the listening
 * to the stream is stopped after the last received event.
 * @issue 31881
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

main() {
  var expectedEvent = RawSocketEvent.READ_CLOSED;
  asyncStart();
  var address = InternetAddress.LOOPBACK_IP_V4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
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
        Expect.equals(false, value);
        Expect.equals(4, count);
      }).whenComplete(() {
        asyncEnd();
      });
    });
  });
}
