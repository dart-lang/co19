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
 * The convert function is called once per data event per listener. If a
 * broadcast stream is listened to more than once, each subscription will
 * individually call convert on each data event.
 *
 * @description Checks that the convert function is called once per data event
 * per listener..
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      int counter = 0;
      int cCounter = 0;
      List list = [];
      List expected = [1, 2, 2, 3];
      int convert(e) {
        cCounter++;
        return (e == RawSocketEvent.write
            ? 1
            : (e == RawSocketEvent.read
                ? 2
                : (e == RawSocketEvent.closed ? 3 : 0)));
      }

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
      }, onDone: () {
        Expect.equals(4, counter);
        Expect.equals(4, cCounter);
        Expect.listEquals(expected, list);
        asyncEnd();
      });
    });
  });
}
