/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future forEach(void action(T element))
 * Executes action on each data event of the stream.
 *
 * Completes the returned Future when all events of the stream have been
 * processed.
 *
 * @description Checks that method [forEach] executes action on each data event
 * of the stream, and the returned Future is completed when all events of the
 * stream have been processed.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(variant, expected) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      int counter = 0;
      List list = [];
      void action1(e) => list.add(e);
      void action2(e) => (e == RawSocketEvent.write
          ? list.add(1)
          : (e == RawSocketEvent.read
              ? list.add(2)
              : (e == RawSocketEvent.closed ? list.add(3) : list.add(0))));
      var action = variant == 1 ? action1 : action2;

      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();

      Stream bcs = receiver.asBroadcastStream();
      bcs.forEach(action).then((_) {
        Expect.listEquals(expected, list);
      }).whenComplete(() {
        asyncEnd();
      });

      new Timer(const Duration(milliseconds: 200), () {
        Expect.isNull(receiver.receive());
        receiver.close();
      });

      bcs.listen((event) {
        counter++;
        receiver.receive();
      }).onDone(() {
        Expect.equals(4, counter);
      });
    });
  });
}

main() {
  check(1, [
    RawSocketEvent.write,
    RawSocketEvent.read,
    RawSocketEvent.read,
    RawSocketEvent.closed
  ]);
  check(2, [1, 2, 2, 3]);
}
