// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// Future<RawDatagramSocket> bind(
///   dynamic host,
///   int port,
///   {bool reuseAddress = true,
///   bool reusePort = false,
///   int ttl = 1}
/// )
/// Binds a socket to the given host and port.
///
/// @description Checks that method bind creates a new raw datagram socket
/// binding it to an address and port.
/// @author ngl@unipro.ru

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
  receiver.listen((_event) {
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
