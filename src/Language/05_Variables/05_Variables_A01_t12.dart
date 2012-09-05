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
 * @description Checks that variable declaration cannot contain both 'const' and 'var'.
 * @author msyabro
 * @reviewer iefremov
 * @compile-error
 */

main() {
  try {
    const var x = 1;
  } catch(ok) {}
}
