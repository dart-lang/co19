// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Datagram receive()
/// Receive a datagram.
/// . . .
/// The maximum length of the datagram that can be received is 65503 bytes.
///
/// @description Checks that the 65504 bytes datagram can not be received.
/// @author ngl@unipro.ru
/// @author shrekhov22@gmail.com
/// @issue 31733

import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;
int datagramLength = 65504;

main() async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<int> sList = new List<int>.filled(datagramLength, 0);
  for (int i = 0; i < datagramLength; i++) {
    sList[i] = i & 0xff;
  }
  int sent = await sendDatagram(producer, sList, localhost, receiver.port);
  if (sent > 0) {
    receiver.listen((_event) {
      if (_event == RawSocketEvent.read) {
        Datagram? d = receiver.receive();
        if (d != null) {
          var len = d.data.toList().length;
          if(len >= 65504) {
            Expect.fail("Received datagram is too long ($len))");
          }
        }
      }
    });
  }
  Future.delayed(Duration(milliseconds: 100)).then((_) {
    producer.close();
    receiver.close();
  });
}
