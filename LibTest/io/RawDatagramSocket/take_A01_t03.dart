/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> take(int count)
 * Provides at most the first count data events of this stream.
 *
 * Forwards all events of this stream to the returned stream until count data
 * events have been forwarded or this stream ends, then ends the returned stream
 * with a done event.
 *
 * If this stream produces fewer than count data events before it's done, so
 * will the returned stream.
 *
 * @description Checks that all events of this stream are forwarded to the
 * returned stream until count data events have been forwarded. (No one sent
 * event was received).
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

check(int n, List expected) {
  asyncStart();
  var address = InternetAddress.LOOPBACK_IP_V4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      Stream s = receiver.take(n);
      s.toList().then((takeList) {
        Expect.listEquals(expected, takeList);
      }).whenComplete(() {
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
  List expected = [
    RawSocketEvent.WRITE,
    RawSocketEvent.READ,
    RawSocketEvent.READ,
    RawSocketEvent.CLOSED
  ];
  check(0, []);
  check(1, expected.sublist(0, 1));
  check(2, expected.sublist(0, 2));
  check(3, expected.sublist(0, 3));
}
