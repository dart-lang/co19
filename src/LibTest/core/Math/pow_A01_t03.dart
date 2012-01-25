/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static num pow(num x, num exponent)
 * @description Checks that if [x] is 1 and [exponent] is finite non-zero number
 * the result is 1.
 * @author msyabro
 * @reviewer pagolubev
 */

main() {
  Expect.equals(1, Math.pow(1, 1.0));
  Expect.equals(1, Math.pow(1.0, -1.0));

  Expect.equals(1, Math.pow(1, -2.0));
  Expect.equals(1, Math.pow(1, 15.12));
  Expect.equals(1, Math.pow(1, 1.7976931348623157e308));
  Expect.equals(1, Math.pow(1.0, 4.9406564584124654e-324));
  Expect.equals(1, Math.pow(1.0, -1.7976931348623157e308));
  Expect.equals(1, Math.pow(1, -4.9406564584124654e-324));
}
