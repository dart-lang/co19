/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A variable declaration statement T id; or T id = e; introduces 
 * a new variable id with static type T into the innermost enclosing scope.
 * @description Checks that the variable created by such statement is not
 * available in a scope that encloses the one it was declared in.
 * @compile-error
 * @author rodionov
 * @reviewer iefremov
 */

main() {
  try {
    {
      int id;
    }
    id = null;
  } catch (var ok) {}
}
