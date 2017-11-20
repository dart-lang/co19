/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isLinkLocal
 * Returns [true] if the [InternetAddresss] scope is a link-local.
 * @description Checks that [isLinkLocal] returns [true] for link-local IPv6
 * addresses (i.e. for [FE80::/10] addresses).
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";

main() {
  dynamic address = new InternetAddress("00:21:2F:B5:6E:10");
  Expect.isTrue(address.isLinkLocal);
}
