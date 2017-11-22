/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> rawAddress
 * Get the raw address of this [InternetAddress].
 * @description Checks that result list contains correct 16 byte long list for
 * IPv6 addresses.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";

check(List expected, List actual) {
  Expect.equals(expected.length, actual.length);
  int i = 0;
  actual.forEach((var element) {
    Expect.equals(expected[i++], element);
  });
}

main() {
  List expected = [32, 1, 13, 184, 0, 0, 0, 66, 0, 0, 138, 46, 3, 112, 115, 52];
  InternetAddress address = new InternetAddress(
      "2001:0db8:0000:0042:0000:8a2e:0370:7334");
  check(expected, address.rawAddress);
}
