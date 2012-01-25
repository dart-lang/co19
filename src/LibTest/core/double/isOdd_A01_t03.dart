/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isOdd()
 * @description Checks on NaN argument.
 * @author pagolubev
 * @reviewer msyabro
 * @needsreview Assumed NaN.isOdd() must yield false.
 */


main() {
  double nan = 0 / 0;
  Expect.isFalse(nan.isOdd());
  Expect.isFalse((-nan).isOdd());
}
