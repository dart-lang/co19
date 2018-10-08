/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<E> drain<E>([E futureValue ])
 * Discards all data on the stream, but signals when it's done or an error
 * occurred.
 *
 * When subscribing using drain, cancelOnError will be true. This means that the
 * future will complete with the first error on the stream and then cancel the
 * subscription.
 *
 * In case of a done event the future completes with the given futureValue.
 *
 * @description Checks that when all events are received with this stream,
 * [drain] discards all this events from the stream and returns given value.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(checkValue) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      int counter = 0;
      Timer timer;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      Stream bcs = receiver.asBroadcastStream();
      Future v = bcs.drain(checkValue);
      v.then((v) {
        Expect.equals(checkValue, v);
        AsyncExpect.value(0, bcs.length);
      });

      bcs.listen((event) {
        receiver.receive();
        counter++;
        if (timer != null) {
          timer.cancel();
        }
        timer = new Timer(const Duration(milliseconds: 200), () {
          Expect.isNull(receiver.receive());
          receiver.close();
          if (counter == 5) {
            asyncEnd();
          }
        });
      }).onDone(() {
        Expect.equals(5, counter);
      });
    });
  });
}

main() {
  check(null);
  check(-10);
  check(0);
  check(18);
  check('abc');
}
