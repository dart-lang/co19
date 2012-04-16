/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A variable declaration statement T id; or T id = e; introduces 
 * a new variable id with static type T into the innermost enclosing scope.
 * @description Checks that a variable is introduced into the scope
 * after a variable declaration statement is evaluated and it is a compile-time
 * error when the variable is referenced in the right-hand part of its own declaration.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

main() {
  try {
    int i = i;
  } catch (var ok) {}
}
