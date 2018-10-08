/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion InternetAddress(String address)
 * Creates a new [InternetAddress] from a numeric address.
 * @description Checks that new [InternetAddress] object with given address and
 * [IPv4] type is created if [address] is a correct address in IPv4 dotted
 * decimal notation.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";

main() {
  InternetAddress address = new InternetAddress("192.168.16.23");
  Expect.equals("192.168.16.23", address.address);
  Expect.equals(InternetAddressType.IPv4, address.type);
}
