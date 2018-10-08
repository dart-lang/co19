/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> isEmpty
 * . . .
 * If the first event is an error, the returned future is completed with that
 * error.
 *
 * @description Checks that if the first event is an error, the returned future
 * is completed with that error, otherwise, it is completed with false.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(convert, expected) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      int counter = 0;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();

      Stream<RawSocketEvent> stream = receiver.asBroadcastStream();
      stream.expand(convert).isEmpty.then((value) {
        if (expected == 11) {
          Expect.fail("value == $value. Future should be completed with error.");
        } else {
          Expect.isFalse(value);
        }
      }, onError: (error) {
        if (expected == 11) {
          Expect.equals(expected, error);
        } else {
          Expect.fail("Future should be completed with false.");
        }
      });

      new Timer(const Duration(milliseconds: 200), () {
        Expect.isNull(receiver.receive());
        receiver.close();
      });

      stream.listen((event) {
        counter++;
        receiver.receive();
      }).onDone(() {
        Expect.equals(4, counter);
        asyncEnd();
      });
    });
  });
}

main() {
  check((e) => e == RawSocketEvent.write ? throw 11 : [e], 11);
  check((e) => e == RawSocketEvent.read ? throw 12 : [e], 12);
  check((e) => e == RawSocketEvent.closed ? throw 13 : [e], 13);
}
