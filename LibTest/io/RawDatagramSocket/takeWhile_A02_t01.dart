/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<RawSocketEvent> takeWhile(bool test(T element))
 * Forwards data events while test is successful.
 * . . .
 * The test call is considered failing if it returns a non-true value or if it
 * throws. If the test call throws, the error is emitted as the last event on
 * the returned streams.
 *
 * @description Checks that if [test] throws, the error is emitted as the last
 * event on the returned streams.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(bool test(e), dataExpected, errorExpected) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      List list = [];
      List errList = [];
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      Stream s = receiver.takeWhile(test);
      s.listen((event) {
        list.add(event);
        receiver.receive();
      }, onError: (e) {
        errList.add(e);
        Expect.listEquals(dataExpected, list);
      }, onDone: () {
        Expect.listEquals(dataExpected, list);
        Expect.listEquals(errorExpected, errList);
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
    RawSocketEvent.write,
    RawSocketEvent.read,
    RawSocketEvent.read,
    RawSocketEvent.closed
  ];

  check((e) => throw 11, [], [11]);
  check((e) => e == RawSocketEvent.closed ? throw 6 : true,
      expected.sublist(0, 3), [6]);
  check((e) => e == RawSocketEvent.read ? throw 7 : true,
      expected.sublist(0, 1), [7]);
  check((e) => e == RawSocketEvent.write ? throw 8 : false, [], [8]);
}
