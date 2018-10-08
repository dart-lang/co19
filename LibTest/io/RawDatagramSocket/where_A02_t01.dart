/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<RawSocketEvent> where (bool test(T event))
 * . . .
 * If the test function throws, the data event is dropped and the error is
 * emitted on the returned stream instead.
 *
 * @description Checks that if the test function throws, the data event is
 * dropped and the error is emitted on the returned stream instead.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(test(e), dataExpected) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      List list = [];
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      Stream bcs = receiver.asBroadcastStream();
      Stream s = bcs.where(test);

      s.listen((event) {
        list.add(event);
      }, onError: (error) {
        list.add(error);
      }, onDone: () {
        Expect.listEquals(dataExpected, list);
        asyncEnd();
      });

      bcs.listen((event) {
        receiver.receive();
      });

      new Timer(const Duration(milliseconds: 200), () {
        Expect.isNull(receiver.receive());
        receiver.close();
      });
    });
  });
}

main() {
  check((e) => e != RawSocketEvent.closed ? true : throw 11,
      [RawSocketEvent.write, RawSocketEvent.read, RawSocketEvent.read, 11]);
  check((e) => e != RawSocketEvent.read ? true : throw 12,
      [RawSocketEvent.write, 12, 12, RawSocketEvent.closed]);
  check((e) => e == RawSocketEvent.write ? throw 13 : true,
      [13, RawSocketEvent.read, RawSocketEvent.read, RawSocketEvent.closed]);
}
