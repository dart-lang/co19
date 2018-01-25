/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<E> asyncExpand<E>(Stream<E> convert(T event))
 * Creates a new stream with the events of a stream per original event.
 *
 * This acts like expand, except that convert returns a Stream instead of an
 * Iterable. The events of the returned stream becomes the events of the
 * returned stream, in the order they are produced.
 *
 * @description Checks that the events of the returned stream becomes the events
 * this stream, in the order they are produced.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

check(convert(event), int n) {
  asyncStart();
  var address = InternetAddress.LOOPBACK_IP_V4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      List expected = [
        RawSocketEvent.WRITE,
        RawSocketEvent.READ,
        RawSocketEvent.READ
      ];
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      int count = sent * n;
      int counter = 0;

      Stream s = receiver.asyncExpand(convert);
      s.listen((e) {
        if (e == RawSocketEvent.CLOSED) {
          return;
        }
        Expect.equals(expected[counter >> (n - 1)], e);
        counter++;
        if (counter >= count) {
          receiver.close();
        }
      }).onDone(() {
        Expect.equals(count, counter);
        asyncEnd();
      });
    });
  });
}

main() {
  check((e) => new Stream.fromIterable([e]), 1);
  check((e) => new Stream.fromIterable([e, e]), 2);
}
