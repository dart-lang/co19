/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uint32List(int length)
 * It is an error if [length] is not a non-negative integer.
 * @description Checks that it is an error if [length] is not a non-negative integer.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(length) {
  try {
    Uint32List l = new Uint32List(length);
    Expect.fail("Error is expected");
  } catch(ok) {
  }
}

main() {
  check(-1);
  check(-100);
  check(-0.5);
  check(1.0);
  check("1");
  check(new Object());
  check([0]);
}
