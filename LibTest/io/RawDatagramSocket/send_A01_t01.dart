/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int send(List<int> buffer, InternetAddress address, int port)
 * Send a datagram.
 *
 * Returns the number of bytes written. This will always be either the size of
 * buffer or 0.
 *
 * @description Checks that method send returns the number of bytes that were
 * sent.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

int sentLength = 65507;

check([bool no_write_events = false]) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      if (no_write_events) {
        receiver.writeEventsEnabled = false;
      }
      Timer timer2;
      int received = 0;
      int sent = 0;
      int count;

      List<int> sList1 = new List<int>(sentLength);
      for (int i = 0; i < sentLength; i++) {
        sList1[i] = i & 0xff;
      }

      List<List<int>> list = [[0], [1, 2, 3], sList1];
      new Timer.periodic(const Duration(microseconds: 1), (timer) {
        count = producer.send(list[sent], address, receiver.port);
        Expect.equals(list[sent].length, count);
        sent++;
        if (sent > 2) {
          timer.cancel();
          producer.close();
        }
      });

      void action() {
        asyncEnd();
      }

      List<int> rList;
      receiver.listen((event) {
        received++;
        var datagram = receiver.receive();
        if (datagram != null) {
          rList = datagram.data;
          Expect.equals(list[received - 1].length, rList.length);
        }
        if (timer2 != null) timer2.cancel();
        timer2 = new Timer(const Duration(milliseconds: 200), () {
          Expect.isNull(receiver.receive());
          receiver.close();
        });
      }).onDone(action);
    });
  });
}

main() {
  check();
  check(true);
}
