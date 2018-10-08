/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isLoopback
 * Returns [true] if the InternetAddress is a loopback address.
 * @description Checks that [isLoopback] returns [true] for loopback IPv4
 * addresses.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";

main() {
  dynamic address = new InternetAddress("127.0.0.1");
  Expect.isTrue(address.isLoopback);
}
