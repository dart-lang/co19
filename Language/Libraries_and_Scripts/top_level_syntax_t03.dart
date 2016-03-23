/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A library consists of (a possibly empty) set of imports, a set
 * of exports, and a set of top level declarations. A top level declaration
 * is either a class, a type alias declaration, a function or a variable
 * declaration. The members of a library L are those top level declarations
 * given within L.
 * topLevelDefinition:
 *   classDefinition |
 *   enumType |
 *   typeAlias |
 *   external? functionSignature ';' |
 *   external? getterSignature ';' |
 *   external? setterSignature ';' |
 *   functionSignature functionBody |
 *   returnType? get identifier functionBody |
 *   returnType? set identifier formalParameterList functionBody |
 *   (final | const) type? staticFinalDeclarationList ';' |
 *   variableDeclaration ';'
 * ;
 * @description Checks that a string literal can't be a top level definition
 * in a library.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

import 'top_level_syntax_t03_lib.dart';

main() {
  try {
    var someVar = '';
  } catch (e) {}
}
