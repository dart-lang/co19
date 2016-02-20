/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A variable declaration statement declares a new local variable.
 *   localVariableDeclaration:
 *     initializedVariableDeclaration ’;’
 *   ;
 * @description Checks that incorrect syntax of type parameters causes compile
 * error.
 * @compile-error
 * @author kaigorodov
 * @reviewer iefremov
 */

class T<K,V> {}

main() {
  try {
    T<int, String;> id;
  } catch (x) {}
}

