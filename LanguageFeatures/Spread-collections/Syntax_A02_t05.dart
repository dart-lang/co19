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
 * @description Checks that spreadable set can not be declared as constant if
 * spreadable element is not a constant.
 * @author iarkh@unipro.ru
 */

main() {
  Set set1 = {"abc", "int", "hello"};
  List list;
  Set set2;
  int i;

  List a;
  a = const {...set2};                                            //# 01: compile-time error
  a = const {"testme", ...set2};                                  //# 02: compile-time error
  a = const {...set2, "testme"};                                  //# 03: compile-time error

  a = const {...list};                                            //# 04: compile-time error
  a = const {"testme", ...list};                                  //# 05: compile-time error
  a = const {...list, "testme"};                                  //# 06: compile-time error

  a = const {"abc", ...set1, "int", "hello", 1, ...list, 2, 12}; //# 07: compile-time error
  a = const {"abc", ...set1, "int", "hello", 1, ...set2, 2, 12}; //# 08: compile-time error

  a = const {...set1, i};                                         //# 09: compile-time error
  a = const {...list, i};                                         //# 10: compile-time error
}

