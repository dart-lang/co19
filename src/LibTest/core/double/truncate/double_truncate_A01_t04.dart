/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double truncate()
 * @description Checks truncation of infinity.
 * @author pagolubev
 * @reviewer msyabro
 */

main() {
  double inf = 1 / 0;
  Expect.equals(inf, inf.truncate());
  Expect.equals(-inf, (-inf).truncate());
}
