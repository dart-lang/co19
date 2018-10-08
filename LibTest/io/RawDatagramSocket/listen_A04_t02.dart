/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * StreamSubscription<RawSocketEvent> listen(
 *     void onData(
 *         T event
 *     ), {
 *     Function onError,
 *     void onDone(),
 *     bool cancelOnError
 * })
 * Adds a subscription to this stream.
 * . . .
 * While a subscription is paused, or when it has been cancelled, the
 * subscription doesn't receive events and none of the event handler functions
 * are called.
 *
 * @description Checks that while a subscription has been cancelled, the
 * subscription doesn't receive events and none of the event handler functions
 * are called.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(int n) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      StreamSubscription ss1 = null;
      StreamSubscription ss2 = null;
      int counter1 = 0;
      int counter2 = 0;
      int counter = 0;
      for (int i = 0; i < 9; i++) {
        producer.send([i], address, receiver.port);
      }
      producer.close();

      Stream bcs = receiver.asBroadcastStream();
      new Timer(const Duration(milliseconds: 200), () {
        Expect.isNull(receiver.receive());
        receiver.close();
      });

      ss1 = bcs.listen((event) {
        counter1++;
      }, onError: (e) {
        Expect.fail('Should not be here.');
      }, onDone: () {
        Expect.fail('Should not be here.');
      });

      bcs.listen((event) {
        counter++;
        receiver.receive();
        if (counter == n) {
          ss1.cancel();
          ss2.cancel();
        }
      }, onDone: () {
        Expect.isTrue(counter1 <= n);
        Expect.equals(counter, 10);
        Expect.isTrue(counter2 <= n);
        asyncEnd();
      });

      ss2 = bcs.listen((event) {
        counter2++;
      }, onError: (e) {
        Expect.fail('Should not be here.');
      }, onDone: () {
        Expect.fail('Should not be here.');
      });

    });
  });
}

main() {
  for (int i = 1; i < 10; i ++) {
    check(i);
  }
}
