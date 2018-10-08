/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<RawSocketEvent> single
 * The single element of this stream.
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

check(convert, expected, [bool no_write_events = false]) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      if (no_write_events) {
        receiver.writeEventsEnabled = false;
      }
      int sent = 0;
      bool stError = false;

      if (expected == 13) {
        producer.close();
        receiver.close();
      } else {
        new Timer.periodic(const Duration(microseconds: 1), (timer) {
          if (sent == 1) {
            timer.cancel();
            producer.close();
            receiver.close();
          } else {
            producer.send([sent], address, receiver.port);
            sent++;
          }
        });
      }

      void action() {
        Expect.isTrue(stError);
        asyncEnd();
      }

      receiver.expand(convert).single.then((event) {
        Expect.fail('Future should be completed with error.');
      }, onError: (error) {
        Expect.equals(expected, error);
        stError = true;
      }).whenComplete(action);
    });
  });
}

main() {
  check((e) => e == RawSocketEvent.write ? throw 11 : [e], 11);
  check((e) => e == RawSocketEvent.read ? throw 12 : [e], 12, true);
  check((e) => e == RawSocketEvent.closed ? throw 13 : [e], 13);
}
