/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A variable declaration statement var id; or var id = e; introduces
 * a new variable named id with static type Dynamic into the innermost enclosing scope.
 * @description Checks that the variable created by such statement is not
 * available in a scope that encloses the one it was declared in.
 * @static-warning
 * @author iefremov
 * @reviewer rodionov
 */

main() {
  try {
    {
      var id;
    }
    id = null;
    Expect.fail("NoSuchMethodError expected when calling undefined setter.");
  } on NoSuchMethodError catch (ex) {}
}
