import "../../../Utils/expect.dart";
/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
 /**
 * @assertion String toStringAsPrecision(int precision)
 * @description Checks that an exception is thrown when [fractionDigit] is too big.
 * @author msyabro
 * @needsreview exception and [fractionDigit] limits is unspecified. From sources  code
 * [fractionDigit] should be in interval [1,21].
 */

main() {
  bool fail = false;
  try {
    .1.toStringAsPrecision(22);
    fail = true;
  } catch(e) {}
  if(fail) {
    Expect.fail("Expected exception");
  }
}
