/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
 /**
 * @assertion String toStringAsPrecision(int precision)
 * @description Checks that for positive and negative infinity the method
 * returns 'Infinity' and '-Infinity' respectively regardless of the
 * [precision] value.
 * @author msyabro
 */

main() {
  for(int i = 1; i < 22; i++) {
    Expect.equals('Infinity', double.INFINITY.toStringAsPrecision(i));
    Expect.equals('-Infinity', double.NEGATIVE_INFINITY.toStringAsPrecision(i));
  }
}
