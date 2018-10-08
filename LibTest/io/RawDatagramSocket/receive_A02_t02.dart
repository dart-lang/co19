/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Datagram receive()
 * Receive a datagram.
 * . . .
 * The maximum length of the datagram that can be received is 65503 bytes.
 *
 * @description Checks that the 65504 bytes datagram can not be received.
 * @author ngl@unipro.ru
 * @issue 31733
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

int sentLength = 65504;

main() {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      Timer timer;
      List<int> sList = new List<int>(sentLength);
      for (int i = 0; i < sentLength; i++) {
        sList[i] = i & 0xff;
      }

      producer.send(sList, address, receiver.port);
      producer.close();

      List<int> rList;
      int longDataLength = 0;
      receiver.listen((event) {
        if (event == RawSocketEvent.closed) {
          if (longDataLength == sentLength) {
            Expect.fail('Long datagram was received: length $longDataLength');
          }
        }
        var datagram = receiver.receive();
        if (datagram != null) {
          rList = datagram.data;
          if (rList.length == sList.length) {
            longDataLength = rList.length;
          }
        }
        if (timer != null) timer.cancel();
        timer = new Timer(const Duration(milliseconds: 200), () {
          Expect.isNull(receiver.receive());
          receiver.close();
        });
      }).onDone(() {
        asyncEnd();
      });
    });
  });
}
