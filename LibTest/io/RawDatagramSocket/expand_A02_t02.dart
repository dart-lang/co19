/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<S> expand<S>(Iterable<S> convert(T value))
 * . . .
 * If calling convert throws, or if the iteration of the returned values throws,
 * the error is emitted on the returned stream and iteration ends for that
 * element of this stream.
 *
 * @description Checks that if the iteration of the returned values throws,
 * the error is emitted on the returned stream and iteration ends for that
 * element of this stream.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(convert, expected) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      int counter = 0;
      List list = [];
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();

      Stream<RawSocketEvent> bcs = receiver.asBroadcastStream();
      Stream stream = bcs.expand(convert);
      stream.listen((event) {
        list.add(event);
      }, onError: (error) {
        list.add(error);
      }, onDone: () {
        Expect.listEquals(expected, list);
        asyncEnd();
      });

      new Timer(const Duration(milliseconds: 200), () {
        Expect.isNull(receiver.receive());
        receiver.close();
      });

      bcs.listen((event) {
        counter++;
        receiver.receive();
      }).onDone(() {
        Expect.equals(4, counter);
      });
    });
  });
}

main() {
  int element(int n) {
    if (n == 5) {
      throw 15;
    }
    return n;
  }
  check(
      (e) => e == RawSocketEvent.write
          ? [element(4), element(5), element(6)]
          : [1, 2, 3],
      [15, 1, 2, 3, 1, 2, 3, 1, 2, 3]);
  check((e) => e == RawSocketEvent.read
      ? [element(4), element(5), element(6)]
      : [1, 2, 3],
      [1, 2, 3, 15, 15, 1, 2, 3]);
  check((e) => e == RawSocketEvent.closed
      ? [element(4), element(5), element(6)]
      : [1, 2, 3],
      [1, 2, 3, 1, 2, 3, 1, 2, 3, 15]);
}
