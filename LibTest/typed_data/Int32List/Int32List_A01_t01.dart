/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Int32List(int length)
 * Creates an [Int32List] of the specified length (in elements), all of whose
 * elements are initially zero.
 * @description Checks that an instance of Int32List of the specified length is
 * created.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(int length) {
  Int32List l = new Int32List(length);
  Expect.isTrue(l is Int32List);
  Expect.equals(l.length, length);
}

main() {
  check(0);
  check(1);
  check(10);
  check(1024);
  check(2048);
}
