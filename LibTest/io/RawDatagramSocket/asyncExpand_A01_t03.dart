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

check(int n, List expected) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      List list = [];
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
        list.add(e);
        if (e == RawSocketEvent.closed) {
          return;
        }
        counter++;
        if (counter >= count) {
          receiver.close();
        }
      }).onDone(() {
        Expect.listEquals(expected, list);
        Expect.equals(count, counter);
        asyncEnd();
      });
    });
  });
}

main() {
  check(0, [
    [0],
    [1],
    [2],
    RawSocketEvent.closed
  ]);
  check(1, [
    [0],
    [0],
    [1],
    [1],
    [2],
    [2],
    RawSocketEvent.closed,
    RawSocketEvent.closed
  ]);
}
