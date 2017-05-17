/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Datagram(List<int> data, InternetAddress address, int port)
 * @description Checks that this constructor creates a new Datagram object. Test
 * IPv6 address and 43 protocol
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  InternetAddress address = new InternetAddress("::1");
  Datagram datagram = new Datagram([1, 2, 3], address, 43);
  Expect.listEquals([1, 2, 3], datagram.data);
  Expect.equals(address, datagram.address);
  Expect.equals(43, datagram.port);
}
