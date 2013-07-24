/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  All possible constant expressions are prescribed in assertions
 * 01_Constants_A01 - 01_Constants_A14 and 01_Constants_A19.
 * There are no other constant expressions.
 * @description Checks that an assignment expression cannot be used to initialize
 * a constant variable.
 * @author iefremov
 * @compile-error
 * @reviewer rodionov
 */

var a;
const m = (a = 1);

main() {
  try {
    print(m);
  } catch(x) {}
}
