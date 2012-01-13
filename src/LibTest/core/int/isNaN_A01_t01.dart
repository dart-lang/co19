/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if the value represented by this int object is a NaN.
 * @description Checks that this method returns correct value (which is false for any integer
 * this type's value range does not include NaNs).
 * @author vasya
 * @author msyabro
 * @reviewer rodionov
 */

main() {
  for (var i = -1000; i <= 1000; i++){
    Expect.isFalse(i.isNaN());
  }

  Expect.isFalse(18446744073709551616.isNaN());
  Expect.isFalse((-18446744073709551616).isNaN());
  Expect.isFalse(3273390607896141870013189696827599152216642046043064789483291368096133796404674554883270092325904157150886684127560071009217256545885393053328527589376.isNaN());
  Expect.isFalse((-3273390607896141870013189696827599152216642046043064789483291368096133796404674554883270092325904157150886684127560071009217256545885393053328527589376).isNaN());
}
