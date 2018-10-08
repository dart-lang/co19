/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<RawSocketEvent> takeWhile(bool test(T element))
 * Forwards data events while test is successful.
 *
 * Returns a stream that provides the same events as this stream until test
 * fails for a data event. The returned stream is done when either this stream
 * is done, or when this stream first emits a data event that fails test.
 *
 * @description Checks that method [takeWhile] returns stream with the same
 * events as this stream as long as test returns true for the event data, and
 * the returned stream is done when this stream first provides a value that test
 * doesn't accept.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(bool test(e), dataExpected) {
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

      Stream s = receiver.takeWhile(test);
      s.listen((event) {
        list.add(event);
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
  check((e) => e != RawSocketEvent.read, [RawSocketEvent.write]);
  check((e) => !(e is RawSocketEvent), []);
  check((e) => false, []);
}
