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

check(int n) {
  asyncStart();
  var address = InternetAddress.LOOPBACK_IP_V4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      int count = sent * (n + 1);
      var dg;
      Stream s;
      if (n == 0) {
        s = receiver.asyncExpand((e) => new Stream.fromIterable(
            [(dg = receiver.receive()) == null ? e : dg.data]));
      } else {
        s = receiver.asyncExpand((e) => new Stream.fromIterable([
              (dg = receiver.receive()) == null ? e : dg.data,
              dg == null ? e : dg.data
            ]));
      }

      int counter = 0;
      s.listen((e) {
        if (e == RawSocketEvent.CLOSED) {
          return;
        }
        Expect.isTrue(e is List);
        Expect.equals(counter >> n, e[0]);
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
  check(0);
  check(1);
}
