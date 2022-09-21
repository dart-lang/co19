// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Datagram receive()
/// Receive a datagram. If there are no datagrams available null is returned.
///
/// @description Checks that if there are no datagrams available [null] is
/// returned.
/// @author ngl@unipro.ru
/// @author shrekhov22@gmail.com

import "dart:io";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

main() async {
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  var d = receiver.receive();
  Expect.isNull(d);
  receiver.close();
}
