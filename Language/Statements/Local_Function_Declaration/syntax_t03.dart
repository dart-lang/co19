/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function declaration statement declares a new local function.
 *   localFunctionDeclaration:
 *     functionSignature functionBody
 *   ;
 * functionSignature:
 *   metadata returnType? identifier formalParameterList
 * ;
 * returnType:
 *   void |
 *   type
 * ;
 * functionBody:
 *   async? ‘=>’ expression ‘;’ |
 *   (async | async* | sync*)?  block
 * ;
 * block:
 *   '{' statements '}'
 * ;
 * @description Checks that it is a compile error if a function with an
 * expression for a body is missing the formal parameter list.
 * @compile-error
 * @author kaigorodov
 * @reviewer rodionov
 */

main() {
  int function1 => 1;
  try {
    function1();
  } catch (x) {}
}
