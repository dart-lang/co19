/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isLinkLocal
 * Returns [true] if the [InternetAddresss] scope is a link-local.
 * @description Checks that [isLinkLocal] returns [false] for IPv6 addresses
 * which are not link-local.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";

main() {
  dynamic address = new InternetAddress("2280::1001:1DFF:FEE0:0");
  Expect.isFalse(address.isLinkLocal);
}
