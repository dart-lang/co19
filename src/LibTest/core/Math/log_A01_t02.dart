/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the natural logarithm (base e) of a double value.
 * @description Checks special values.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview undocumented
 */

main() {
  Expect.isTrue(Math.log(double.NAN).isNaN());
  Expect.equals(double.INFINITY, Math.log(double.INFINITY));
  Expect.isTrue(Math.log(double.NEGATIVE_INFINITY).isNaN());
}
