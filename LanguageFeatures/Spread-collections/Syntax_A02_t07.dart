/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The grammar changes for map and set are a little more complex
 * because of the potential ambiguity of collections containing only spreads.
 * The changed and new rules are:
 *
 *    setOrMapLiteral:
 *    mapLiteral |
 *    setLiteral |
 *    mapOrSetLiteral
 *    ;
 *
 *    mapLiteral:
 *    const? typeArguments? '{' mapLiteralEntryList? '}'
 *    ;
 *
 *    mapLiteralEntryList:
 *    mapLiteralEntry ( ',' mapLiteralEntry )* ','?
 *    ;
 *
 *    mapLiteralEntry:
 *    expression ':' expression |
 *    spread
 *    ;
 *
 *    setLiteral:
 *    'const'? typeArguments? '{' spreadableList '}' ;
 *
 *    mapOrSetLiteral:
 *    'const'?  '{' spread (',' spread)* '}' ;
 *
 * @description Checks that spreadable map can not be declared as constant if
 * spreadable element is not a constant.
 * @author iarkh@unipro.ru
 */

main() {
  Map map1 = {1: 1, 2: 4, 3: 6};
  Map map2;
  int i;

  Map a;
  a = const {...map2};          //# 01: compile-time error
  a = const {...map1, ...map2}; //# 02: compile-time error
  a = const {...map2, ...map1}; //# 03: compile-time error

  a = const {...map2, 10: 2};   //# 04: compile-time error
  a = const {10: 2, ...map2};   //# 05: compile-time error

  a = const {...map1, i: 10};   //# 06: compile-time error
  a = const {...map1, 10: i};   //# 07: compile-time error
  a = const {i: 10, ...map1};   //# 08: compile-time error
  a = const {10: i, map1};      //# 09: compile-time error
}
