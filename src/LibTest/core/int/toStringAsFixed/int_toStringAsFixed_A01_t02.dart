/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toStringAsFixed(int fractionDigits)
 * Converts a number into string with the specified number of digits after the decimal point.
 * @description Tries to pass an argument that is out of allowed range, expects an exception.
 * @author msyabro
 * @reviewer rodionov
 * @neeedsreview Allowed range undocumented
 */

main() {
  check(0, -1);
  check(0, -0x8000000000000000);
  check(0, 0x8000000000000000);
}

void check(int x, int digits) {
  try {
    x.toStringAsFixed(digits);
    Expect.fail("Some exception is expected");
  } catch(var e) {
    // TODO: specify exact type
  }
}
