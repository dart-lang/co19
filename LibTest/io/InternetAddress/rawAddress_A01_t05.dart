/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> rawAddress
 * Get the raw address of this [InternetAddress].
 * @description Checks that result list for IPv5 address is 16 byte long and
 * contains expected values if some zero values are omitted in the original
 * [InternetAddress] string.
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
  List expected = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 1, 57, 0, 1];
  InternetAddress address = new InternetAddress("::12:139:1");
  check(expected, address.rawAddress);

  expected = [0, 17, 2, 172, 1, 77, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  address = new InternetAddress("11:2ac:14d::");
  check(expected, address.rawAddress);

  expected = [0, 17, 2, 172, 1, 77, 0, 0, 0, 0, 0, 18, 1, 57, 0, 1];
  address = new InternetAddress("11:2ac:14d::12:139:1");
  check(expected, address.rawAddress);
}
