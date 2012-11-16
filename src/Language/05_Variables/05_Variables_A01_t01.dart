/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion variableDeclaration:
 *     declaredIdentifier (‘, ’ identifier)*
 *   ;
 *   declaredIdentifier:
 *     metadata finalConstVarOrType identifier
 *   ;
 *   finalConstVarOrType:
 *     final type? |
 *     const type? |
 *     varOrType
 *   ;
 *   varOrType:
 *     var |
 *     type
 *   ;
 *   initializedVariableDeclaration:
 *     declaredIdentifier (‘=’ expression)? (‘, ’ initializedIdentifier)*
 *   ;
 *   initializedIdentifier:
 *     identifier (‘=’ expression)?
 *   ;
 *   initializedIdentifierList:
 *     initializedIdentifier (‘, ’ initializedIdentifier)*
 *   ;
 * @description Checks various valid variable declarations.
 * @author iefremov
 * @reviewer msyabro
 */

final topLevelFinal = const {};
final int someConstant = 1;
bool __1;
var i2 = 2;
const topLevelConst = 1;
const String stringConstant = '';

main() {
  final String $tring = "";
  final v1 = 1, v2 = 2;
  final f = null;
  const constant = true;
  const bool anotherConstant = 1 < 2;
  var init = 5;
  var v;
  int i;

  String $tring2, $tring3, $$$tring;
  var $, $$, $$$;
  Object list = [], map = {};
  final x = {}, y = [];
  const a = const {}, b = const [];

  topLevelFinal;
  someConstant;
  topLevelConst;
  stringConstant;
  __1;
  i2;
}
