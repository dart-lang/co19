/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let c1 and c2 be a pair of constants. Then c1 === c2 iff  c1 == c2.
 * @description Checks that two constants are identical iff they are equal.
 * @author msyabro
 * @reviewer rodionov
 */

main() {
  Expect.isTrue(1 === 1);
  Expect.isTrue(1 === 1 + 0);
  Expect.isTrue(1 === (1 * 1));
  Expect.isFalse(1 === 2);

  Expect.isTrue('' === "");
  Expect.isFalse('' === ' ');
}
