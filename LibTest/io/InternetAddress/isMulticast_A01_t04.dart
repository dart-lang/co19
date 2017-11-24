/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isMulticast
 * Returns [true] if the [InternetAddresss] scope is multicast.
 * @description Checks that [isLinkLocal] returns [false] for non-multicast IPv6
 * addresses.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";

main() {
  dynamic address = new InternetAddress("1201:11:0:40:0:77:11:6");
  Expect.isFalse(address.isMulticast);
}
