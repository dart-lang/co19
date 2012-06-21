/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  All possible constant expressions are prescribed in assertions
 * 01_Constants_A01 - 01_Constants_A14 and 01_Constants_A19.
 * There are no other constant expressions.
 * @description Checks that a string literal that involves string interpolation,
 * that is a constant expression not evaluated to numeric, string or boolean value,
 * cannot be assigned to a constant variable.
 * @author iefremov
 * @compile-error
 * @reviewer rodionov
 */

const l = "${const {'k1': 1, 'k2': 2}}";

main() {
  try {
    print(l);
  } catch(var x) {}
}
