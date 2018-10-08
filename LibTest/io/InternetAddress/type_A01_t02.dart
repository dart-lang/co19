/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion InternetAddressType type
 * The type of the [InternetAddress] specified what IP protocol.
 * @description Checks that type is set to [IPv6] for IPv6 addresses
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";

check(String addr) {
  InternetAddress address = new InternetAddress(addr);
  Expect.equals(InternetAddressType.IPv6, address.type);
}

main() {
  check("19:abc:14:128:22:11:a13d:0");
  check("::");
  check("::1");
  check("::11:124:a");
  check("11:124:a::");
  check("11:124:a::d:113");
}
