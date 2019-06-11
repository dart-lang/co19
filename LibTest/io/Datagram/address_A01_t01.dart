/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion InternetAddress address
 * @description Checks that this property changes internet address
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  InternetAddress address = new InternetAddress("127.0.0.1");
  Datagram datagram = new Datagram(new Uint8List(0), address, 80);
  Expect.equals(address, datagram.address);

  address = new InternetAddress("::127");
  datagram.address = address;
  Expect.equals(address, datagram.address);

  address = new InternetAddress("2001:0db8:11a3:09d7:1f34:8a2e:07a0:765d");
  datagram.address = address;
  Expect.equals(address, datagram.address);

  address = new InternetAddress("::ffff:192.0.2.1");
  datagram.address = address;
  Expect.equals(address, datagram.address);
}
