// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion bool readEventsEnabled
/// Set or get, if the RawDatagramSocket should listen for RawSocketEvent.read
/// events. Default is true.
///
/// @description Checks that the [RawDatagramSocket] should not listen for
/// [RawSocketEvent.read] events, if [readEventsEnabled] is false.
/// @author ngl@unipro.ru
/// @author shrekhov22@gmail.com

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
  receiver.readEventsEnabled = false;
  receiver.listen((_event) {
    if (_event == RawSocketEvent.read) {
      Expect.fail("Read events should not be listened");
    }
  });
  Future.delayed(Duration(milliseconds: 100)).then((_) {
    producer.close();
    receiver.close();
  });
}
