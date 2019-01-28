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
 * @description Checks that exception is thrown if spreadable element is not
 * set for spreadable set.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=spread-collections

main() {
  Set set;
  List list;
  List list1 =[1, 2, 3];
  int i;

  List a;
  a = {...set};              //# 01: compile-error
  a = {"testme", ...set};    //# 02: compile-error
  a = {...set, "testme"};    //# 03: compile-error

  a = {...list};             //# 04: compile-error
  a = {"testme", ...list};   //# 05: compile-error
  a = {...list, "testme"};   //# 06: compile-error

  a = {"abc", ...list1,  i}; //# 07: compile-error
}

