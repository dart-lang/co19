/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  All possible constant expressions are prescribed in assertions
 * 01_Constants_A01 - 01_Constants_A14. There are no other constant expressions.
 * @description Checks that a string literal that involves string interpolation,
 * that evaluates to a numeric value, but not a constant expression,
 * cannot be assigned to a constant variable.
 * @compile-error
 * @author msyabro
 * @reviewer iefremov
 */

foo() => 1;

const i1 = "${foo()}";

main() {
  try {
    print(i1);
  } catch(var x) {}
}
