/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<RawSocketEvent> last
 * . . .
 * If this stream emits an error event, the returned future is completed with
 * that error and processing stops.
 *
 * @description Checks that if this stream emits an error event, the returned
 * future is completed with that error and processing stops.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

check(convert, expected) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      int counter = 0;

      Stream stream = receiver.asBroadcastStream();
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();

      stream.expand(convert).last.then((event) {  print('ev: $event');
        Expect.fail("event == $event. Future should be completed with error.");
      }, onError: (error) {
        Expect.equals(expected, error);
      }).whenComplete (() {
        asyncEnd();
      });

      stream.listen((e) {
        counter++;
        receiver.receive();
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
  check((e) => e == RawSocketEvent.write ? throw 11 : [e], 11);
  check((e) => e == RawSocketEvent.read ? throw 12 : [e], 12);
  check((e) => e == RawSocketEvent.closed ? throw 13 : [e], 13);
}
