/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isOdd()
 * @description Checks on infinity argument.
 * @author pagolubev
 * @reviewer msyabro
 * @needsreview Assumes [:isOdd():] must yield false on infinity.
 */


main() {
  double inf = 1 / 0;
  Expect.isFalse(inf.isOdd());
  Expect.isFalse((-inf).isOdd());
}
