/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<int> length
 * The number of elements in this stream.
 *
 * Waits for all elements of this stream. When the stream ends, the returned
 * future is completed with the number of elements.
 *
 * @description Checks that property length returns the number of elements
 * in the socket when this RawDatagramSocket is closed (returns 1).
 * @author ngl@unipro.ru
 */
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
      var rValue;

      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();
      receiver.close();

      void action() {
        Expect.equals(1, rValue);
        asyncEnd();
      }

      receiver.length.then((value) {
        rValue = value;
      }).whenComplete (action);
    });
  });
}

main() {
  check();
  check(true);
}
