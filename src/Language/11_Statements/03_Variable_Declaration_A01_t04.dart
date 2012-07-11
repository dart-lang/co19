/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A variable declaration statement T id; or T id = e; introduces 
 * a new variable id with static type T into the innermost enclosing scope.
 * @description Checks that a variable declaration statement T id = e; 
 * must end with a semicolon.
 * @compile-error
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

class T {}

main() {
  try {
    T id = new T()
  } catch (var ok) {}
}

