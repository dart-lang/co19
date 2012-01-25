/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion x == y returns whether x and y are the same value.
 * x == y returns true when x === y returns true or when x and y represent the same value. 
 * An exception to this is if either side of == evaluates to the double value NaN,
 * the result is false.
 * @description Checks that the operator returns true if operands are equal.
 * @author iefremov
 * @needsreview it's not clear what is equal and what is not
 * @reviewer pagolubev
 */



main() {
  Expect.isTrue(12 == 12.0);
}
