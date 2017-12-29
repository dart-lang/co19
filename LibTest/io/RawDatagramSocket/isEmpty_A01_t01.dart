/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> isEmpty
 * Reports whether this stream contains any elements.
 *
 * Stops listening to the stream after the first element has been received.
 *
 * Internally the method cancels its subscription after the first element. This
 * means that single-subscription (non-broadcast) streams are closed and cannot
 * be reused after a call to this getter.
 *
 * @description Checks that isEmpty returns false as RawDatagramSocket cannot
 * be empry.
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
    if (no_write_events) {
      producer.writeEventsEnabled = false;
    }
    var socket = producer.asBroadcastStream();
    Timer timer2;
    var rValue;

    void act() {
      Expect.isFalse(rValue);
      producer.close();
      asyncEnd();
    }

    socket.isEmpty.timeout(const Duration(milliseconds: 200), onTimeout: () {
      producer.close();
    });

    socket.isEmpty.then((value) {
      rValue = value;
      if (timer2 != null) timer2.cancel();
      timer2 = new Timer(const Duration(milliseconds: 200), () {
        Expect.isNull(producer.receive());
      });
    }).whenComplete(act);
  });
}

main() {
  check();
  check(true);
}
