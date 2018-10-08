/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String address
 * For IPv4 addresses this is using the dotted-decimal notation.
 * @description Checks that [address] string is correct for IPv4 addresses in
 * decimal dotted format.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";

main() {
  dynamic address = new InternetAddress("192.168.16.23");
  Expect.equals("192.168.16.23", address.address);

  address = new InternetAddress("1.1.0.1");
  Expect.equals("1.1.0.1", address.address);

}
