/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let c1 and c2 be a pair of constants. Then identical(c1, c2) iff:
 * - c1 evaluates to either null, a constant map, an constant list, an instance
 *   of bool, num, String or Type and c1 == c2 , OR
 * - c1 and c2 are constant objects of the same class C and for each member
 *   field of c1 is identical to the corresponding field of c2 .
 * where identical() is the predefined dart function that returns true iff its two
 * arguments are either:
 *  • The same object.
 *  • Of type int and have the same numeric value.
 *  • Of type double, are not NaNs and have the same numeric value.
 * @description Checks that two doubles representing the same value are identical.
 * @author kaigorodov
 * @reviewer rodionov
 * @needsreview issue 7024
 */

mul(var d1, var d2) {
  return d1*d2;
}
  
main() {
  var d1=32000.5;
  var d2=33000.5;
  Expect.isTrue(identical(d1, d1));
  Expect.isTrue(identical(2.5, 2.5));
  Expect.isTrue(identical(2.5, 2.5-0.0));
  Expect.isTrue(identical(2.5, 5.0/2));
  Expect.isTrue(identical(1.5*2, 1.5*2));
  Expect.isTrue(identical(mul(d1,d2), mul(d1,d2)));
  Expect.isTrue(identical(mul(d1,d2), mul(d2,d1)));
}
