/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isEven()
 * @description Checks the method on infinity.
 * @author pagolubev
 * @reviewer msyabro
 * @needsreview Assumes [:isEven():] must yield false.
 */


main() {
  double inf = 1 / 0;
  Expect.isFalse(inf.isEven());
  Expect.isFalse((-inf).isEven());
}
