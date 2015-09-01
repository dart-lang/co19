/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A variable declaration statement declares a new local variable.
 *   localVariableDeclaration:
 *     initializedVariableDeclaration ’;’ .
 * @description Checks that a variable declaration statement var id = e; introduces
 * a new variable id with static type dynamic into the innermost enclosing scope.
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

class C {}

main() {
  var id = 0;
  Expect.isTrue(id is dynamic);
  id = false;
  id = "";
  id = 2;
  id = new C();
  id = (){};
}
