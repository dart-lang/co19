/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toRadixString(int radix)
 * Converts a number into radix string.
 * @description Checks that using a radix that is outside of the allowed radix range results in an exception.
 * @author msyabro
 * @reviewer rodionov
 * @needsreview Allowed range undocumented
 */
import "../../../Utils/expect.dart";

main() {
  check(0, -1);
  check(0, 0);
  check(0, 1);
//  check(0, 17);
  check(0, 0x80000000);
  check(0, -0x80000000);
}

void check(int i, int r) {
  Expect.throws(() {
    i.toRadixString(r);
  });
}
