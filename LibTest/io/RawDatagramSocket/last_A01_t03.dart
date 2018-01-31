/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<RawSocketEvent> last
 * Returns the last element of the stream.
 *
 * @description Checks that property last returns the last element of the
 * stream when not all sent events were received and RawDatagramSocket was
 * closed.
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
      int sent = 0;
      var rEvent;
      int counter = 0;

      Stream stream = receiver.asBroadcastStream();
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();

      stream.last.then((event) {
        rEvent = event;
      }).whenComplete (() {
        Expect.equals(RawSocketEvent.CLOSED, rEvent);
        Expect.equals(2, counter);
        asyncEnd();
      });

      stream.listen((e) {
        counter++;
        receiver.receive();
        if (counter == 1) {
          receiver.close();
        }
      });

      new Timer(const Duration(milliseconds: 200), () {
        Expect.isNull(receiver.receive());
        receiver.close();
      });
    });
  });
}

main() {
  check();
  check(true);
}
