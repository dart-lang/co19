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
 * returnType: void | type
 * ;
 * functionBody:
 *   '=>' expression ';' | block
 * ;
 * block:
 *   '{' statements '}'
 * ;
 * @description Checks that it is a compile error if a function with a block
 * does not have formalParameterList
 * @compile-error
 * @author  kaigorodov
 */

main() {
  void function1 {}
  try {
    function1();
  } catch(x){}
}
