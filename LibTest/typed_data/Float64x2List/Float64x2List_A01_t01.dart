/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float64x2List(int length)
 * Creates a Float64x2List of the specified length (in elements), all of whose
 * elements have all lanes set to zero.
 * @description Checks that an instance of [Float64x2List] of specified length
 * is created.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(int length) {
  Float64x2List l = new Float64x2List(length);
  Expect.isTrue(l is Float64x2List);
  Expect.equals(length, l.length);
}

main() {
  check(1);
  check(10);
  check(1024);
  check(2048);
}
