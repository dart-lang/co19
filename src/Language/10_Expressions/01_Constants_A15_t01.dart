/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  All possible constant expressions are prescribed in assertions
 * 01_Constants_A01 - 01_Constants_A14. There are no other constant expressions.
 * @description Checks that a string literal that involves string interpolation
 * cannot be assigned to a static final variable.
 * @author iefremov
 * @compile-error
 * @reviewer rodionov
 */

final i1 = "${2+2}";

main() {
  try {
    print(i1);
  } catch(var x) {}
}
