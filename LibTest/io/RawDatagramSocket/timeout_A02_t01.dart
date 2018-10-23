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

check(List dataExpected, [bool no_write_events = false]) {
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
      bool writeDataNotNull = false;
      int totalSent = 0;

      new Timer.periodic(const Duration(milliseconds: 20), (timer) {
        totalSent += producer.send([sent], address, receiver.port);
        sent++;
        if (sent > 2) {
          timer.cancel();
          if (totalSent != sent) {
            Expect.fail('$totalSent messages were sent instead of $sent.');
          }
          producer.close();
        }
      });

      Stream s = receiver.timeout(const Duration(milliseconds: 5),
          onTimeout: (EventSink sink) {
        count++;
      });
      Timer timer;
      s.listen((event) {
        list.add(event);
        Datagram d = receiver.receive();
        if (event == RawSocketEvent.write && d != null) {
          writeDataNotNull = true;
        }
        if (timer != null) {
          timer.cancel();
        }
        timer = new Timer(const Duration(milliseconds: 200), () {
          Expect.isNull(receiver.receive());
          receiver.close();
        });
      }, onDone: () {
        Expect.isTrue(count > 0);
        if (writeDataNotNull) {
          dataExpected.removeAt(1);
        }
        Expect.deepEquals(dataExpected, list);
        if (timer != null) {
          timer.cancel();
        }
        asyncEnd();
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
