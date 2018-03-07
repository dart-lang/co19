/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<RawSocketEvent> first
 * The first element of the stream.
 * . . .
 * If an error event occurs before the first data event, the returned future is
 * completed with that error.
 *
 * @description Checks that if an error event occurs before the first data
 * event, the returned future is completed with that error.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

check(convert, expected) {
  asyncStart();
  var address = InternetAddress.LOOPBACK_IP_V4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      Timer timer2;
      int sent = 0;
      bool completed = false;
      new Timer.periodic(const Duration(microseconds: 1), (timer) {
        if (sent == 10 || completed) {
          timer.cancel();
          producer.close();
        } else {
          producer.send([sent++], address, receiver.port);
        }
      });

      void action() {
        completed = true;
        receiver.close();
        asyncEnd();
      }

      receiver.expand(convert).first.then((event) { // print(event);
        if (expected == 11) {
          Expect.fail('Future should be completed with an error.');
        } else {
          Expect.equals(RawSocketEvent.WRITE, event);
        }
        if (timer2 != null) timer2.cancel();
        timer2 = new Timer(const Duration(milliseconds: 200), () {
          Expect.isNull(receiver.receive());
        });
      }, onError: (error) {
        if (expected == 11) {
          Expect.equals(11, error);
        } else {
          Expect.fail('Future should be completed with RawSocketEvent.WRITE');
        }
      }).whenComplete(action);
    });
  });
}

main() {
  check((e) => e == RawSocketEvent.WRITE ? throw 11 : [e], 11);
  check((e) => e == RawSocketEvent.READ ? throw 12 : [e], 12);
  check((e) => e == RawSocketEvent.CLOSED ? throw 13 : [e], 13);
}
