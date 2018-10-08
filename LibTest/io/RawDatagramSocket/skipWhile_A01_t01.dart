/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<RawSocketEvent> skipWhile(bool test(T element))
 * Skip data events from this stream while they are matched by test.
 *
 * Returns a stream that emits the same events as this stream, except that data
 * events are not emitted until a data event fails test.
 *
 * @description Checks that the returned stream contains all events starting
 * with the first data event where [test] returns false for the event data.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(test(e), expected) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      int counter = 0;
      List list = [];
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      Stream bcs = receiver.asBroadcastStream();

      Stream s = bcs.skipWhile((e) => test(e));
      s.listen((event) {
        list.add(event);
      }, onDone: () {
        Expect.listEquals(expected, list);
        asyncEnd();
      });

      bcs.listen((event) {
        receiver.receive();
        counter++;
      }).onDone(() {
        Expect.equals(4, counter);
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
  check((e) => e == RawSocketEvent.write, expected.sublist(1));
  check((e) => e != RawSocketEvent.read, expected.sublist(1));
  check((e) => e != RawSocketEvent.closed, expected.sublist(3));
  check((e) => true, []);
  check((e) => false, expected);
}
