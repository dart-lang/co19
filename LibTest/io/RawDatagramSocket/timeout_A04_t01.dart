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
 * If onTimeout is omitted, a timeout will just put a TimeoutException into the
 * error channel of the returned stream. If the call to onTimeout throws, the
 * error is emitted on the returned stream.
 *
 * @description Checks that if onTimeout is omitted, a timeout will just put a
 * TimeoutException into the error channel of the returned stream.
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
      List errList = [];
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      Stream s = receiver.timeout(const Duration(milliseconds: 10));
      s.listen((event) {
        list.add(event);
        receiver.receive();
      }, onError: (e) {
        Expect.isTrue(e is TimeoutException);
        errList.add(e);
      }, onDone: () {
        Expect.listEquals(dataExpected, list);
        Expect.isTrue(errList.length > 0);
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
    RawSocketEvent.closed
  ]);
  check([
    RawSocketEvent.read,
    RawSocketEvent.read,
    RawSocketEvent.read,
    RawSocketEvent.closed
  ], true);
}
