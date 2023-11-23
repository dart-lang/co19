// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool writeEventsEnabled
/// Set or get, if the [RawDatagramSocket] should listen for
/// [RawSocketEvent.write] events. Default is true. This is a one-shot listener,
/// and writeEventsEnabled must be set to true again to receive another write
/// event.
///
/// @description Checks that if writeEventsEnabled is false, then this event is
/// ignored.
/// @author sgrekhov22@gmail.com

import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

final localhost = InternetAddress.loopbackIPv4;

main() async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> data = [[0, 1, 2, 3, 4], [5, 6, 7], [8, 9], [10]];
  for (int i = 0; i < data.length; i++) {
    await sendDatagram(producer, data[i], localhost, receiver.port);
  }
  receiver.writeEventsEnabled = false;
  receiver.listen((_event) {
    if (_event == RawSocketEvent.write) {
      Expect.fail("Write events must be disabled");
    }
    if (_event == RawSocketEvent.read) {
      Datagram? d = receiver.receive();
      if (d != null) {
        Expect.isTrue(containsReceived(data, d));
      }
    }
  });
  Future.delayed(Duration(milliseconds: 100)).then((_) {
    producer.close();
    receiver.close();
  });
}
