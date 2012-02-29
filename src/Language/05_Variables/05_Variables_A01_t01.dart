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
 * declaredIdentifier: finalVarOrType identifier ;
 * finalVarOrType: final type? | var | type ;
 * @description Checks various valid variable declarations.
 * @author iefremov
 * @reviewer msyabro
 */

final topLevelFinal = const {};
final int someConstant = 1;
bool __1;
var i2 = 2;

main() {
  final String $tring = "";
  final v1 = 1, v2 = 2;
  final f = null;
  var init = 5;
  var v;
  int i;

  String $tring2, $tring3, $$$tring;
  var $, $$, $$$;
  Object list = [], map = {};

  topLevelFinal;
  someConstant;
  __1;
  i2;
}

