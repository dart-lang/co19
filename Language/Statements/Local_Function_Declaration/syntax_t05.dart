/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
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
 * @description Checks that it is a compile time error if a local function
 * declared with the function body of a form `=> expession` has `async*` before
 * a function body.
 * @compile-error
 * @author ngl@unipro.ru
 */

main() {
  f0() async* => 3;
}
