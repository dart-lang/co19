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
 * . . .
 * Whenever more than timeLimit passes between two events from this stream, the
 * onTimeout function is called, which can emit further events on the returned
 * stream.
 *
 * The countdown doesn't start until the returned stream is listened to. The
 * countdown is reset every time an event is forwarded from this stream, or when
 * the stream is paused and resumed.
 *
 * @description Checks that whenever more than timeLimit passes between two
 * events from this stream, the onTimeout function is called, which can emit
 * further events on the returned stream.
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
      int count = 0;
      int sent = 0;
      List list = [];

      new Timer.periodic(const Duration(milliseconds: 20), (timer) {
        producer.send([sent], address, receiver.port);
        sent++;
        if (sent > 2) {
          timer.cancel();
          producer.close();
        }
      });

      Stream s = receiver.timeout(const Duration(milliseconds: 10),
          onTimeout: (EventSink sink) {
        count++;
      });
      s.listen((event) {
        list.add(event);
        receiver.receive();
      }, onDone: () {
        Expect.listEquals(dataExpected, list);
        Expect.isTrue(count > 0);
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
  check([
    RawSocketEvent.write,
    RawSocketEvent.read,
    RawSocketEvent.read,
    RawSocketEvent.read,
    RawSocketEvent.closed
  ]);
  check([
    RawSocketEvent.read,
    RawSocketEvent.read,
    RawSocketEvent.read,
    RawSocketEvent.closed
  ], true);
}
