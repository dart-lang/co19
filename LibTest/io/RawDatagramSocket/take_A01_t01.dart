/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<RawSocketEvent> take(int count)
 * Provides at most the first count data events of this stream.
 *
 * Returns a stream that emits the same events that this stream would if
 * listened to at the same time, until either this stream ends or it has emitted
 * count data events, at which point the returned stream is done.
 *
 * If this stream produces fewer than count data events before it's done, so
 * will the returned stream.
 *
 * Starts listening to this stream when the returned stream is listened to and
 * stops listening when the first count data events have been received.
 *
 * @description Checks that the events of this stream are forwarded to the
 * returned stream until count data events have been forwarded or this stream
 * ends. (This RawDatagramStream is closed without receiving any sent events.)
 * If this stream produces fewer than count data events before it's done, this
 * stream will be returned.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(int n, List expected) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
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
  check(1, [RawSocketEvent.closed]);
  check(2, [RawSocketEvent.closed]);
  check(3, [RawSocketEvent.closed]);
  check(4, [RawSocketEvent.closed]);
  check(5, [RawSocketEvent.closed]);
}
