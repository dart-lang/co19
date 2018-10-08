/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion InternetAddressType type
 * The type of the [InternetAddress] specified what IP protocol.
 * @description Checks that type is set to [IPv4] for IPv4 addresses
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";

main() {
  dynamic address = new InternetAddress("192.168.16.23");
  Expect.throws(() {
    address.type = InternetAddressType.IPv6;
  }, (e) => e is NoSuchMethodError);
}
