/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int port
 * @description Checks that this property changes port
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  InternetAddress address = new InternetAddress("127.0.0.1");
  Datagram datagram = new Datagram(new Uint8List(0), address, 80);
  Expect.equals(80, datagram.port);

  datagram.port = 43;
  Expect.equals(43, datagram.port);

  datagram.port = -89876876876843;
  Expect.equals(-89876876876843, datagram.port);
}
