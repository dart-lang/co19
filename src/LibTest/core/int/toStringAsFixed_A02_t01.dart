/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toStringAsFixed(int fractionDigits)
 * The parameter fractionDigits must be an integer satisfying: 0 <= fractionDigits <= 20.
 * @description Tries to pass an argument that is out of allowed range, expects an exception.
 * @author msyabro
 * @reviewer rodionov
 * @neeedsreview Exact error/exception unspecified
 */

main() {
  check(0, -1);
  check(0, -0x8000000000000000);
  check(0, 0x8000000000000000);
}

void check(int x, int digits) {
  bool fail = false;
  try {
    x.toStringAsFixed(digits);
    fail = true;
  } catch(e) {}
  Expect.isFalse(fail, "Exception expected");
}
