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
 * @description Checks that if [test] throws, this error is emitted as an error
 * event on the returned stream instead of the data event, and it is considered
 * as [test] failure.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(test(e), dataExpected, errorExpected) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      int counter = 0;
      List list = [];
      List errList = [];
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      Stream bcs = receiver.asBroadcastStream();
      Stream s = bcs.skipWhile((e) => test(e));
      s.listen((event) {
        list.add(event);
      }, onError: (e) {
        errList.add(e);
      }, onDone: () {
        Expect.listEquals(dataExpected, list);
        Expect.listEquals(errorExpected, errList);
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
  check((e) => throw 11, expected.sublist(1), [11]);
  check((e) => e == RawSocketEvent.read ? throw 6 : e != RawSocketEvent.closed,
      expected.sublist(2), [6]);
  check((e) => e == RawSocketEvent.read ? throw 7 : true, expected.sublist(2),
      [7]);
  check((e) => e == RawSocketEvent.read ? throw 8 : false, expected, []);
}
