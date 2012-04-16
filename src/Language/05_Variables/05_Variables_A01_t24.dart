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
 * declaredIdentifier: finalConstVarOrType identifier ;
 * finalConstVarOrType: final type? | const type? | var | type ;
 * @description Checks that variable can't be initialized with itself.
 * @author hlodvig
 * @reviewer iefremov
 * @compile-error
 * @needsreview TODO: find a proper assertion for this test. Ensure that there is no duplicates.
 */

main() {
  try {
    var x = x;
  } catch(var z) {}
}
