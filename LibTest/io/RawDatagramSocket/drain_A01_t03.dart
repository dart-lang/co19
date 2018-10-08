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
 * @description Checks that future is completed with null, when futureValue is
 * not specified.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      int counter = 0;
      Timer timer;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      Stream bcs = receiver.asBroadcastStream();
      Future v = bcs.drain();
      v.then((v) {
        Expect.equals(null, v);
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
          if (counter == 3) {
            asyncEnd();
          }
        });
      });
    });
  });
}
