// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void close()
/// Close the datagram socket.
///
/// @description Checks that if RawDatagramSocket is closed with method close,
/// it does not receive sent events.
/// @author ngl@unipro.ru

import "dart:async";
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

main() async {
  bool first = false;
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0, 1, 2, 3, 4], [5, 6, 7], [8, 9], [10]];

  for (int i = 0; i < toSend.length; i++) {
    await sendDatagram(producer, toSend[i], localhost, receiver.port);
  }

  receiver.listen((_event) {
    if (_event == RawSocketEvent.read) {
      if (first) {
        Expect.fail("Closed socket should no receive anything");
      } else {
        first = true;
        Datagram? d = receiver.receive();
        if (d != null) {
          Expect.isTrue(containsReceived(toSend, d));
          receiver.close();
        }
      }
    }
  });
  Future.delayed(Duration(milliseconds: 100)).then((_) {
    producer.close();
  });
}
