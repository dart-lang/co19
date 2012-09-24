/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A variable declaration statement T id; or T id = e; introduces 
 * a new variable id with static type T into the innermost enclosing scope.
 * @description Checks that the variable must be declared before it is used.
 * @static-warning
 * @author iefremov
 * @reviewer rodionov
 */

main() {
  try {
    Expect.equals(null, i);
    int i;
    Expect.fail("NoSuchMethodError expected when calling undefined getter.");
  } on NoSuchMethodError catch (ex) {}
}
