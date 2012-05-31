/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A library consists of (a possibly empty) set of imports, and a set of top level
 * declarations. A top level declaration is either a class, an interface, a type
 * declaration, a function or a variable declaration.
 * topLevelDefinition:
 * classDefinition |
 * interfaceDefinition |
 * functionTypeAlias |
 * functionSignature functionBody |
 * returnType? getOrSet identifier formalParameterList function-Body |
 * (final | const) type? staticFinalDeclarationList ';' |
 * variableDeclaration ';'
 * ;
 * getOrSet:
 * get |
 * set
 * ;.
 * @description Checks that an arbitrary sequence of symbols (which is not an identifier)
 * can't be a top level definition in a library.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

#import('12_libraries_and_Scripts_A01_t19_lib.dart');

main() {
  try {
    var someVar = '';
  } catch(var e) {}
}
