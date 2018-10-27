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

check(List dataExpected, [bool no_write_events = false]) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      if (no_write_events) {
        receiver.writeEventsEnabled = false;
      }
      int sent = 0;
      Timer timer;
      List list = [];
      int totalSent = 0;
      int nullWriteData = 0;

      totalSent += producer.send([sent++], address, receiver.port);
      totalSent += producer.send([sent++], address, receiver.port);
      if (totalSent != sent) {
        Expect.fail('$totalSent messages were sent instead of $sent.');
      }
      producer.close();

      Stream s = receiver.timeout(const Duration(milliseconds: 300));
      s.listen((event) {
        list.add(event);
        Datagram d = receiver.receive();
        if (event == RawSocketEvent.write && d == null) {
          nullWriteData = 1;
        }
        if (timer != null) {
          timer.cancel();
        }
        timer = new Timer(const Duration(milliseconds: 200), () {
          Expect.isNull(receiver.receive());
          receiver.close();
        });
      }, onDone: () {
        if (timer != null) {
          timer.cancel();
        }
        if (nullWriteData != 0) {
          dataExpected.insert(1, RawSocketEvent.read);
        }
        Expect.deepEquals(dataExpected, list);
        asyncEnd();
      });
    });
  });
}

main() {
  check([RawSocketEvent.write, RawSocketEvent.read, RawSocketEvent.closed]);
  check(
      [RawSocketEvent.read, RawSocketEvent.read, RawSocketEvent.closed], true);
}
