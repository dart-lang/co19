/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Int32x4List(int length)
 * Creates a Int32x4List of the specified length (in elements), all of whose
 * elements are initially zero.
 * @description Checks that an instance of Int32x4List of the specified length
 * is created.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(length) {
  var l = new Int32x4List(length);
  Expect.isTrue(l is Int32x4List);
  Expect.equals(l.length, length);
}

main() {
  check(0);
  check(1);
  check(10);
  check(1024);
  check(2048);
}
