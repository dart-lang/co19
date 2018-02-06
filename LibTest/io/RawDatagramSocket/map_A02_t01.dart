/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<S> map<S>(S convert(T event))
 * Creates a new stream that converts each element of this stream to a new value
 * using the convert function.
 * . . .
 * If convert throws, the returned stream reports the exception as an error
 * event instead.
 *
 * Error and done events are passed through unchanged to the returned stream.
 *
 * @description Checks that if convert throws, the returned stream reports the
 * exception as an error event instead.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

check(convert(event), List expected, int dExpected, int eExpected) {
  asyncStart();
  var address = InternetAddress.LOOPBACK_IP_V4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      int counter = 0;
      int errCounter = 0;
      List list = [];
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      new Timer(const Duration(milliseconds: 200), () {
        Expect.isNull(receiver.receive());
        receiver.close();
      });

      Stream stream = receiver.map(convert);
      stream.listen((event) {
        list.add(event);
        receiver.receive();
        counter++;
      }, onError: (error) {
        errCounter++;
        list.add(error);
        receiver.receive();
      }, onDone: () {
        Expect.equals(dExpected, counter);
        Expect.equals(eExpected, errCounter);
        Expect.listEquals(expected, list);
        asyncEnd();
      });
    });
  });
}

main() {
  check(
      (e) => e == RawSocketEvent.WRITE ? throw 1 : e,
      [1, RawSocketEvent.READ, RawSocketEvent.READ, RawSocketEvent.CLOSED],
      3,
      1);
  check((e) => e == RawSocketEvent.READ ? throw 2 : e,
      [RawSocketEvent.WRITE, 2, 2, RawSocketEvent.CLOSED], 2, 2);
  check(
      (e) => e == RawSocketEvent.CLOSED ? throw 3 : e,
      [RawSocketEvent.WRITE, RawSocketEvent.READ, RawSocketEvent.READ, 3],
      3,
      1);
}
