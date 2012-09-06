/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A variable declaration statement T id; or T id = e; introduces 
 * a new variable id with static type T into the innermost enclosing scope.
 * @description Checks that a variable is introduced into the scope
 * after a variable declaration statement is evaluated. Checks that a variable name
 * is not available in a local function that is used in the initializing expression
 * of that variable's declaration.
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 */

main() {
  try {
    var x;
    Function f = () {x = f};
  } catch(x) {}
}
