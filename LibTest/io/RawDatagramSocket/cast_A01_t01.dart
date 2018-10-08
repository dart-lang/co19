/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<R> cast <R>()
 * Adapt this stream to be a Stream<R>.
 *
 * If this stream already has the desired type, its returned directly. Otherwise
 * it is wrapped as a Stream<R> which checks at run-time that each data event
 * emitted by this stream is also an instance of R.
 *
 * @description Checks that if this stream already has the desired type, its
 * returned directly.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  List expected = [
    RawSocketEvent.write,
    RawSocketEvent.read,
    RawSocketEvent.read,
    RawSocketEvent.closed
  ];
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      int counter = 0;
      Timer timer;
      List list = [];
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      Stream s = receiver.cast<RawSocketEvent>();

      s.listen((event) {
        list.add(event);
        receiver.receive();
        counter++;
        if (timer != null) {
          timer.cancel();
        }
        timer = new Timer(const Duration(milliseconds: 200), () {
          Expect.isNull(receiver.receive());
          receiver.close();
        });
      }).onDone(() {
        Expect.equals(4, counter);
        Expect.listEquals(expected, list);
        asyncEnd();
      });
    });
  });
}
