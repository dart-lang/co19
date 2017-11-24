/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> rawAddress
 * The returned list is a copy, making it possible to change the list without
 * modifying the [InternetAddress].
 * @description Checks that for IPv6 result [List] is a copy, i.e. its elements
 * can be modified without the original [InternetAddress] row list update.
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

test(String addr) {
  InternetAddress address = new InternetAddress(addr);
  List expected = address.rawAddress;
  List list = address.rawAddress;
  check(expected, list);
  check(expected, address.rawAddress);
  list[3] = 11;
  check(expected, address.rawAddress);
  list[1]++;
  check(expected, address.rawAddress);
}

main() {
  test("2001:0db8:0000:0042:0000:8a2e:0370:7334");
  test("::");
  test("::1");
  test("::1:abc:14");
  test("ff02:1:14:3a::");
  test("ff02:1:14:3a::22:4");
}
