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
 * returned stream until count data events have been forwarded or this stream
 * ends, when this stream is closed without receiving any sent events. If this
 * stream produces fewer than count data events before it's done, this stream
 * will be returned.
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
      receiver.close();

      Stream s = receiver.take(n);
      s.toList().then((takeList) {
        Expect.listEquals(expected, takeList);
      }).whenComplete(() {
        asyncEnd();
      });
    });
  });
}

main() {
  check(0, []);
  check(1, [RawSocketEvent.CLOSED]);
  check(2, [RawSocketEvent.CLOSED]);
  check(3, [RawSocketEvent.CLOSED]);
  check(4, [RawSocketEvent.CLOSED]);
  check(5, [RawSocketEvent.CLOSED]);
}
