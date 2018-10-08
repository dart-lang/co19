/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * StreamSubscription<RawSocketEvent> listen(
 *     void onData(
 *         T event
 *     ), {
 *     Function onError,
 *     void onDone(),
 *     bool cancelOnError
 * })
 * Adds a subscription to this stream.
 * . . .
 * On each data event from this stream, the subscriber's onData handler is
 * called. If onData is null, nothing happens.
 *
 * @description Checks that on each data event from this stream, the
 * subscriber's onData handler is called.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(int n, expected) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      int counter = 0;
      List actual = [];
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();
      if (n == 0) {
        receiver.close();
      }

      new Timer(const Duration(milliseconds: 200), () {
        Expect.isNull(receiver.receive());
        receiver.close();
      });

      receiver.listen((event) {
        actual.add(event);
        counter++;
        receiver.receive();
        if (counter == n) {
          receiver.close();
        }
      }, onDone: () {
        Expect.listEquals(expected, actual);
        asyncEnd();
      });
    });
  });
}

main() {
  check(0, [RawSocketEvent.closed]);
  check(1, [RawSocketEvent.write, RawSocketEvent.closed]);
  check(2, [RawSocketEvent.write, RawSocketEvent.read, RawSocketEvent.closed]);
  check(3, [
    RawSocketEvent.write,
    RawSocketEvent.read,
    RawSocketEvent.read,
    RawSocketEvent.closed
  ]);
}
