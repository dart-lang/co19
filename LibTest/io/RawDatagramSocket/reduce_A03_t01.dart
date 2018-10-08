/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Future<RawSocketEvent> reduce(
 *     RawSocketEvent combine(T previous, T element)
 * )
 * . . .
 * When this stream is done, the returned future is completed with the value at
 * that time.
 *
 * @description Checks that when this stream is done, the returned future is
 * completed with the value at that time.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(nReceived) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      int counter = 0;
      RawSocketEvent combine(previous, element) {
        if (element == RawSocketEvent.closed) {
          return previous;
        }
        if (element == RawSocketEvent.read) {
          return element;
        }
        return previous;
      }

      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      Stream bcs = receiver.asBroadcastStream();
      Future future = bcs.reduce(combine);
      future.then((event) {
        Expect.equals(
            nReceived == 1 ? RawSocketEvent.write : RawSocketEvent.read, event);
      }).whenComplete(() {
        asyncEnd();
      });

      bcs.listen((event) {
        receiver.receive();
        counter++;
        if (counter == nReceived) {
          receiver.close();
        }
      }).onDone(() {
        Expect.equals(nReceived + 1, counter);
      });

      new Timer(const Duration(milliseconds: 200), () {
        Expect.isNull(receiver.receive());
        receiver.close();
      });
    });
  });
}

main() {
  for (int i = 1; i < 5; i++) {
    check(i);
  }
}
