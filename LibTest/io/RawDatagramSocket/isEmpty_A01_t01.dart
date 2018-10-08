/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> isEmpty
 * Whether this stream contains any elements.
 *
 * Waits for the first element of this stream, then completes the returned
 * future with true. If the stream ends without emitting any elements, the
 * returned future is completed with false.
 *
 * @description Checks that isEmpty returns false as RawDatagramSocket cannot
 * be empty.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

check([bool no_write_events = false]) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    if (no_write_events) {
      producer.writeEventsEnabled = false;
    }
    var socket = producer.asBroadcastStream();
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
    }).whenComplete(act);
  });
}

main() {
  check();
  check(true);
}
