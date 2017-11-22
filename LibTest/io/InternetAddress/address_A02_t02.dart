/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String address
 * For IPv6 it is using the hexadecimal representation.
 * @description Checks that [address] string is correct for some reserved IPv6
 * addresses (localhost and unspecified)
 * address
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";

main() {
  // localhost
  dynamic address = new InternetAddress("::1");
  Expect.equals("::1", address.address);

  // unspecified
  address = new InternetAddress("::");
  Expect.equals("::", address.address);

}
