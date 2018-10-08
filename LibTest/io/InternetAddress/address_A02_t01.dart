/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String address
 * For IPv6 it is using the hexadecimal representation.
 * @description Checks that [address] string is correct for IPv6 addresses
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";

main() {
  dynamic address =
    new InternetAddress("2001:0db8:0000:0042:0000:8a2e:0370:7334");
  Expect.equals("2001:0db8:0000:0042:0000:8a2e:0370:7334", address.address);
}
