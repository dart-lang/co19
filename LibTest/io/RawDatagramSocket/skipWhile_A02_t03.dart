/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<RawSocketEvent> skipWhile(bool test(T element))
 * Skip data events from this stream while they are matched by test.
 * . . .
 * The test fails when called with a data event if it returns a non-true value
 * or if the call to test throws. If the call throws, the error is emitted as an
 * error event on the returned stream instead of the data event, otherwise the
 * event that made test return non-true is emitted as the first data event.
 *
 * Error and done events are provided by the returned stream unmodified.
 *
 * @description Checks that if this stream is closed, the done event is provided
 * by the return stream unmodified.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(test(e), expected, int count) {
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
        if (counter == count) {
          receiver.close();
        }
      }).onDone(() {
        Expect.equals(count + 1, counter);
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
    RawSocketEvent.read,
    RawSocketEvent.closed
  ];
  for (int i = 1; i < 4; i++) {
    check((e) => e != RawSocketEvent.closed, [RawSocketEvent.closed], i);
    List l = expected.sublist(5 - i);
    l.insert(0, RawSocketEvent.write);
    check((e) => e == RawSocketEvent.closed, l, i);
    check((e) => e == RawSocketEvent.write, expected.sublist(5 - i), i);
  }
  check((e) => e != RawSocketEvent.read, [], 1);
}
