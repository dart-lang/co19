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
 * @description Checks several assignments of variables declared as "T id = e;"
 * that are correct and do not produce static warnings.
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

class T {}
class S extends T {}
class C extends S {}

main() {
  T id = new T();

  id = new S();
  id = new C();

  bool id1 = false;
  id1 = true;

  String id2 = null;
  id2 = "";
}
