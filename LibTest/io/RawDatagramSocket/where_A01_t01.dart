/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<RawSocketEvent> where (bool test(T event))
 * Creates a new stream from this stream that discards some elements.
 *
 * The new stream sends the same error and done events as this stream, but it
 * only sends the data events that satisfy the test.
 *
 * @description Checks that method [where] creates a new stream from this stream
 * and returned stream contains elements that satisfy the test.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

check(test(e), dataExpected) {
  asyncStart();
  var address = InternetAddress.LOOPBACK_IP_V4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      List list = [];
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      Stream s = receiver.where(test);
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
  List expected = [
    RawSocketEvent.WRITE,
    RawSocketEvent.READ,
    RawSocketEvent.READ,
    RawSocketEvent.CLOSED
  ];
  check((e) => e != RawSocketEvent.CLOSED, expected.sublist(0, 3));
  check((e) => e == RawSocketEvent.WRITE || e == RawSocketEvent.READ,
      expected.sublist(0, 3));
  check((e) => true, expected);
}
