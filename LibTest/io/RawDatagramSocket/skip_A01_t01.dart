/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<RawSocketEvent> skip(int count)
 * Skips the first count data events from this stream.
 *
 * Returns a stream that emits the same events as this stream would if listened
 * to at the same time, except that the first count data events are not emitted.
 * The returned stream is done when this stream is.
 *
 * If this stream emits fewer than count data events before being done, the
 * returned stream emits no data events.
 *
 * @description Checks that method [skip] skips the first count data events from
 * this stream, and if this stream emits fewer than count data events before
 * being done, the returned stream emits no data events.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(n, expected) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      List list = [];
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();
      receiver.close();

      Stream s = receiver.skip(n);
      s.listen((event) {
        list.add(event);
        receiver.receive();
      }).onDone(() {
        Expect.listEquals(expected, list);
        asyncEnd();
      });
    });
  });
}

main() {
  check(0, [RawSocketEvent.closed]);
  check(1, []);
  check(10, []);
}
