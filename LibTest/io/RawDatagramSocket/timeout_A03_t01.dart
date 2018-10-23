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
 * The onTimeout function is called with one argument: an EventSink that allows
 * putting events into the returned stream. This EventSink is only valid during
 * the call to onTimeout. Calling EventSink.close on the sink passed to
 * onTimeout closes the returned stream, and no further events are processed.
 *
 * @description Checks that calling EventSink.close on the sink passed to
 * onTimeout closes the returned stream, and no further events are processed.
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
      Timer timer;
      List list = [];
      int totalSent = 0;
      int nullWriteData = 0;

      totalSent += producer.send([sent++], address, receiver.port);
      totalSent += producer.send([sent++], address, receiver.port);
      totalSent += producer.send([sent++], address, receiver.port);
      if (totalSent != sent) {
        Expect.fail('$totalSent messages were sent instead of $sent.');
      }
      producer.close();

      Stream s = receiver.timeout(const Duration(milliseconds: 20),
          onTimeout: (EventSink sink) => sink.close());
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
        int list_length = list.length;
        if (nullWriteData == 1) {
          dataExpected.insert(1, RawSocketEvent.read);
        }
        Expect.deepEquals(dataExpected.sublist(0, list_length), list);
        asyncEnd();
      });
    });
  });
}

main() {
  check([RawSocketEvent.write, RawSocketEvent.read, RawSocketEvent.read]);
  check([RawSocketEvent.read, RawSocketEvent.read, RawSocketEvent.read], true);
}
