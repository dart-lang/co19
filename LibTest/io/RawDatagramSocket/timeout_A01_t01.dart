/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Stream<RawSocketEvent> timeout (
 *     Duration timeLimit, {
 *     void onTimeout(
 *         EventSink<T> sink
 *     )
 * })
 * Creates a new stream with the same events as this stream.
 *
 * @description Checks that method [timeout] creates a new stream with the same
 * events as this stream.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(dataExpected, [bool no_write_events = false]) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      if (no_write_events) {
        receiver.writeEventsEnabled = false;
      }
      int sent = 0;
      List list = [];
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      Stream s = receiver.timeout(const Duration(milliseconds: 300));
      s.listen((event) {
        list.add(event);
        receiver.receive();
      }, onDone: () {
        Expect.listEquals(dataExpected, list);
        asyncEnd();
      });
      new Timer(const Duration(milliseconds: 200), () {
        Expect.isNull(receiver.receive());
        receiver.close();
      });
    });
  });
}

main() {
  check([RawSocketEvent.write, RawSocketEvent.read, RawSocketEvent.closed]);
  check(
      [RawSocketEvent.read, RawSocketEvent.read, RawSocketEvent.closed], true);
}
