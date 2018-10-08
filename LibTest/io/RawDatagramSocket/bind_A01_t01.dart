/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Future<RawDatagramSocket> bind(
 *    host,
 *    int port, {
 *    bool reuseAddress: true
 * })
 * Creates a new raw datagram socket binding it to an address and port.
 *
 * @description Checks that method bind creates a new raw datagram socket
 * binding it to an address and port.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      Expect.equals(address, producer.address);
      Expect.equals(address, receiver.address);
      Expect.notEquals(0, producer.port);
      Expect.notEquals(0, receiver.port);
      int sent = 0;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      var received = 0;
      var timer;
      receiver.listen((event) {
        if (event != RawSocketEvent.read) return;
        var datagram = receiver.receive();
        Expect.listEquals([received++], datagram.data);
        if (timer != null) timer.cancel();
        timer = new Timer(const Duration(milliseconds: 200), () {
          Expect.isNull(receiver.receive());
          receiver.close();
          asyncEnd();
        });
      });
    });
  });
}
