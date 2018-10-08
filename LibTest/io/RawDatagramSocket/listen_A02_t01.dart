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
 * If onData is null, nothing happens.
 *
 * If this stream closes and sends a done event, the onDone handler is called.
 *
 * @description Checks that onData can be null, and if this stream closes and
 * sends a done event, the onDone handler is called.
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
      int counter = 0;
      List actual = [];
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();
      Stream bcs = receiver.asBroadcastStream();
      if (n == 0) {
        receiver.close();
      }

      new Timer(const Duration(milliseconds: 200), () {
        Expect.isNull(receiver.receive());
        receiver.close();
      });

      bcs.listen((event) {
        counter++;
        var dg = receiver.receive();
        actual.add(dg != null ? dg.data[0] : null);
        if (counter == n) {
          receiver.close();
        }
      }, onDone: () {
        bcs.listen((null
        ), onDone: () {
          Expect.listEquals(expected, actual);
          asyncEnd();
        });
      });
    });
  });
}

main() {
  check(0, [null]);
  check(1, [0, null]);
  check(2, [0, 1, null]);
  check(3, [0, 1, 2, null]);
}
