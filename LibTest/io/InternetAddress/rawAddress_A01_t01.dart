/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> rawAddress
 * Get the raw address of this [InternetAddress].
 * @description Checks that result list contains correct 4 byte long list for
 * IPv4 addresses in dotted decimal format.
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
  InternetAddress address = new InternetAddress("192.168.71.114");
  List<int> list = address.rawAddress;
  Expect.equals(4, list.length);
  Expect.equals(192, list[0]);
  Expect.equals(168, list[1]);
  Expect.equals(71, list[2]);
  Expect.equals(114, list[3]);

  address = new InternetAddress("1.1.0.1");
  list = address.rawAddress;
  Expect.equals(4, list.length);
  Expect.equals(1, list[0]);
  Expect.equals(1, list[1]);
  Expect.equals(0, list[2]);
  Expect.equals(1, list[3]);
}
