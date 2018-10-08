/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<E> asyncExpand<E>(Stream<E> convert(T event))
 * Transforms each element into a sequence of asynchronous events.
 *
 * Returns a new stream and for each event of this stream, do the following:
 *
 * - If the event is an error event or a done event, it is emitted directly by
 *   the returned stream.
 * - Otherwise it is an element. Then the convert function is called with the
 *   element as argument to produce a convert-stream for the element.
 * - If that call throws, the error is emitted on the returned stream.
 * - . . .
 * - Otherwise, this stream is paused and convert-stream is listened to. Every
 *   data and error event of the convert-stream is emitted on the returned
 *   stream in the order it is produced. When the convert-stream ends, this
 *   stream is resumed.
 *
 * @description Checks that the convert function is called with the element as
 * argument to produce a convert-stream for the element, and a convert-stream
 * is emitted on the returned stream in the order it is produced.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

check(convert, int n) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      List expected = [
        RawSocketEvent.write,
        RawSocketEvent.read,
        RawSocketEvent.read,
        RawSocketEvent.closed
      ];
      List list = [];
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      int count = sent * n;
      int counter = 0;

      Stream s = receiver.asyncExpand(convert);
      s.listen((e) {
        list.add(e);
        if (e == RawSocketEvent.closed) {
          return;
        }
        counter++;
        if (counter >= count) {
          receiver.close();
        }
      }).onDone(() {
        if (n == 1) {
          Expect.listEquals(expected, list);
        } else {
          for (int i = 0; i < list.length; i+=2) {
            Expect.equals(expected[i >> 1], list[i]);
            Expect.equals(expected[i >> 1], list[i + 1]);
          }
        }
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
