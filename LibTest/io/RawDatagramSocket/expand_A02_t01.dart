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
 * @description Checks that if calling convert throws, the error is emitted on
 * the returned stream and iteration ends for that element of this stream.
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
  check((e) => e == RawSocketEvent.WRITE ? throw 11 : [e],
      [11, RawSocketEvent.READ, RawSocketEvent.READ, RawSocketEvent.CLOSED]);
  check((e) => e == RawSocketEvent.READ ? throw 12 : [e],
      [RawSocketEvent.WRITE, 12, 12, RawSocketEvent.CLOSED]);
  check((e) => e == RawSocketEvent.CLOSED ? throw 13 : [e],
      [RawSocketEvent.WRITE, RawSocketEvent.READ, RawSocketEvent.READ, 13]);

  check((e) => e == RawSocketEvent.WRITE ? throw 11 : [1, 2, 3],
      [11, 1, 2, 3, 1, 2, 3, 1, 2, 3]);
  check((e) => e == RawSocketEvent.READ ? throw 12 : [1, 2, 3],
      [1, 2, 3, 12, 12, 1, 2, 3]);
  check((e) => e == RawSocketEvent.CLOSED ? throw 13 : [1, 2, 3],
      [1, 2, 3, 1, 2, 3, 1, 2, 3, 13]);
}
