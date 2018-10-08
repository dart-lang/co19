/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool readEventsEnabled
 * Set or get, if the RawDatagramSocket should listen for RawSocketEvent.read
 * events. Default is true.
 *
 * @description Checks that the RawDatagramSocket should not listen for
 * RawSocketEvent.read events, if readEventsEnabled is false.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

check(int expReceive, [bool no_read_events = false]) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      if (no_read_events) {
        receiver.readEventsEnabled = false;
      }
      Timer timer2;
      int received = 0;
      int sent = 0;
      var read = 0;

      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      void action() {
        if (no_read_events) {
          Expect.equals(2, received);
          Expect.equals(0, read);
        } else {
          Expect.equals(5, received);
          Expect.notEquals(0, read);
        }
        asyncEnd();
      }

      int s = 0;
      receiver.listen((event) {
        received++;
        if (event == RawSocketEvent.read) {
          read++;
        }
        var datagram = receiver.receive();
        if (datagram != null) {
          Expect.listEquals([s++], datagram.data);
        }
        if (timer2 != null) timer2.cancel();
        timer2 = new Timer(const Duration(milliseconds: 400), () {
          receiver.close();
        });
      }).onDone(action);
    });
  });
}

main() {
  check(5);
  check(2, true);
}
