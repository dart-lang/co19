/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isLoopback
 * Returns [true] if the InternetAddress is a loopback address.
 * @description Checks that [isLoopback] returns [false] for non-loopback IPv6
 * addresses.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";

main() {
  dynamic address = new InternetAddress("11:28:3:0:44:16:4:1");
  Expect.isFalse(address.isLoopback);
}
