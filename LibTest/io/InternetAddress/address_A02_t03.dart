/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String address
 * For IPv6 it is using the hexadecimal representation.
 * @description Checks that [address] string is correct for IPv6 addresses with
 * some values omitted.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";

main() {
  dynamic address = new InternetAddress("::1:abc:14");
  Expect.equals("::1:abc:14", address.address);

  address = new InternetAddress("ff02:1:14:3a::");
  Expect.equals("ff02:1:14:3a::", address.address);

  address = new InternetAddress("ff02:1:14:3a::22:4");
  Expect.equals("ff02:1:14:3a::22:4", address.address);
}
