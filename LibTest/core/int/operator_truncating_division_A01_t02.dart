/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion This operator implements truncating division.
 * @description Tries to pass zero as argument.
 * @author vasya
 * @needsreview undocumented
 * @reviewer msyabro
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

main() {
  check(1);
  check(-1);
  check(0);
  check(0x10000000000000000);
}

void check(int x) {
  try {
    x ~/ 0;
    Expect.fail("IntegerDivisionByZeroException expected when calling ~/");
  } on IntegerDivisionByZeroException catch(ok) { }
}
