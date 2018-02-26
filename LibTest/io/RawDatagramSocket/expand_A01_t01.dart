/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<S> expand<S>(Iterable<S> convert(T value))
 * Transforms each element of this stream into a sequence of elements.
 *
 * Returns a new stream where each element of this stream is replaced by zero or
 * more data events. The event values are provided as an Iterable by a call to
 * convert with the element as argument, and the elements of that iterable is
 * emitted in iteration order.
 *
 * @description Checks that method [expand] returns a new stream where each
 * element of this stream is replaced by zero or more data events.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

check(convert, expected) {
  asyncStart();
  var address = InternetAddress.LOOPBACK_IP_V4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();
      receiver.close();

      var stream = receiver.expand(convert);
      Future l = stream.toList();
      l.then((v) {
        Expect.listEquals(expected, v);
      }).whenComplete(() {
        asyncEnd();
      });
    });
  });
}

main() {
  check((e) => [], []);
  check((e) => [e], [RawSocketEvent.CLOSED]);
  check((e) => [e, e], [RawSocketEvent.CLOSED, RawSocketEvent.CLOSED]);
  check((e) => [1, 2, 3], [1, 2, 3]);
}
