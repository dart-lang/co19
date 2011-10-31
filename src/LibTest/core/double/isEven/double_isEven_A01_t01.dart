/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isEven()
 * @description Checks [:isEven():] on a bunch of doubles that are equal to
 * math integers.
 * @author pagolubev
 * @reviewer msyabro
 */


check(double d, bool expected) {
  Expect.equals(d.isEven(), expected);
  Expect.equals((-d).isEven(), expected);
}

main() {
  double max = 999.0;
  for(double d = .0; d < max; ) {
    check(d, true); ++d;
    check(d, false); ++d;
  }
}
