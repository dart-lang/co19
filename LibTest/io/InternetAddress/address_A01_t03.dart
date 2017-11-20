/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String address
 * The numeric address of the host. For IPv4 addresses this is using the
 * dotted-decimal notation.
 * @description Checks that [address] string is correct for IPv4 addresses in
 * dotted octal byte format.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";

main() {
  dynamic address = new InternetAddress("0300.0000.0002.0353");
  Expect.equals("0300.0000.0002.0353", address.address);
}
