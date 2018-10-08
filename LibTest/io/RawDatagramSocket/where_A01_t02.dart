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
  List expected = [
    RawSocketEvent.write,
    RawSocketEvent.read,
    RawSocketEvent.read,
    RawSocketEvent.closed
  ];
  check((e) => e != RawSocketEvent.closed, expected.sublist(0, 3));
  check((e) => e != RawSocketEvent.read,
      [RawSocketEvent.write, RawSocketEvent.closed]);
  check((e) => e != RawSocketEvent.write, expected.sublist(1));
  check((e) => e == RawSocketEvent.closed, expected.sublist(3));
  check((e) => e == RawSocketEvent.read, expected.sublist(1, 3));
  check((e) => e == RawSocketEvent.write, expected.sublist(0, 1));
  check((e) => true, expected);
  check((e) => false, []);
}
