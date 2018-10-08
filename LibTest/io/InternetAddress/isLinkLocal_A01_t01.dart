/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isLinkLocal
 * Returns [true] if the [InternetAddresss] scope is a link-local.
 * @description Checks that [isLinkLocal] returns [true] for link-local IPv4
 * addresses (i.e. for [169.254.1.0] - [169.254.254.255] addresses).
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";

main() {
  dynamic address = new InternetAddress("169.254.0.1");
  Expect.isTrue(address.isLinkLocal);
}
