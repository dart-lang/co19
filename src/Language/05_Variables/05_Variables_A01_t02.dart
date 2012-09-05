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
 * @description Checks various valid initialized variable declarations.
 * @author iefremov
 * @reviewer rodionov
 * @note Add const variables once they're implemented
 */

main() {
  final String $tring = "";
  final f = null;
  var v = 1 + 2;
  int i = 42 * 0;

  final String
    $tring1 = "But could you play",
    $tring3 = "right to the finish",
    $tring4 = "a nocturne on a drainpipe flute";

    var x, y = 1 + 2, z = 3 * 4;
    double d, d1 = 0.5, d2;
}
