// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Datagram receive()
/// Receive a datagram. If there are no datagrams available null is returned.
///
/// @description Checks that if there are no datagrams available [null] is
/// returned.
/// @author ngl@unipro.ru
/// @author shrekhov22@gmail.com

import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

final localhost = InternetAddress.loopbackIPv4;

main() async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  for (int i = 0; i < 5; i++) {
    await sendDatagram(producer, [], localhost, receiver.port);
  }
  receiver.listen((_event) {
    if (_event == RawSocketEvent.read) {
      Datagram? d = receiver.receive();
      Expect.isNull(d);
    }
  });
  Future.delayed(Duration(milliseconds: 100)).then((_) {
    producer.close();
    receiver.close();
  });
}
