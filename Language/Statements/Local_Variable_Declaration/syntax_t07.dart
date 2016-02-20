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
 * @description Checks that a declared local variable is also available in the
 * nested scopes.
 * @author rodionov
 * @reviewer iefremov
 */

main() {
  int id;
  {
    id = 1;
    for (int i = 0; i < 1; i++) {
      id = 2;
      try {
        id = 3;
      } catch (ok) {}
    }
  }
}
