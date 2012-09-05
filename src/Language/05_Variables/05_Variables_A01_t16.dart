/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion variableDeclaration: declaredIdentifier (',' identifier)* ;
 * initializedVariableDeclaration: declaredIdentifier ('=' expression)? (',' initializedIdentifier)* ;
 * initializedIdentifierList: initializedIdentifier (',' initializedIdentifier)* ;
 * initializedIdentifier: identifier ('=' expression)? ;
 * declaredIdentifier: metadata finalConstVarOrType identifier ;
 * finalConstVarOrType: final type? | const type? | var | type ;
 * @description Checks that a variable declaration cannot contain the 'factory' keyword.
 * @author kaigorodov
 * @reviewer iefremov
 * @compile-error
 */

class C {
  factory var x = 1;
}

main() {
  try {
    new C();
  } catch(ok) {}
}
