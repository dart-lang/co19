/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<RawSocketEvent> takeWhile(bool test(T element))
 * Forwards data events while test is successful.
 * . . .
 * Stops listening to this stream after the accepted elements.
 *
 * Internally the method cancels its subscription after these elements. This
 * means that single-subscription (non-broadcast) streams are closed and cannot
 * be reused after a call to this method.
 *
 * @description Checks that method [takeWhile] stops listening to the stream
 * after the accepted elements and cancels its subscription, so that
 * single-subscription (non-broadcast) streams are closed and cannot be reused
 * after a call to this method.
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

      Stream s = receiver.takeWhile(test);
      s.listen((event) {
        list.add(event);
        receiver.receive();
      }, onDone: () {
        Expect.listEquals(dataExpected, list);
        asyncEnd();
      });

      try {
        s.listen((event) {
          Expect.fail('Should not be here.');
        });
      } catch (e) {
        Expect.isTrue(e is StateError);
      }

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
  check((e) => e != RawSocketEvent.READ, expected.sublist(0, 1));
  check((e) => true, expected);
  check((e) => false, []);
}
