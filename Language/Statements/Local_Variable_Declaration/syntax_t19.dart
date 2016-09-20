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
 * @description Checks that the variable declared 'var id;' in a block is not
 * available in another block that isn't included in the first one.
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 */
main() {
  {
    var id;
  }
  {
    id = null;
  }
}
