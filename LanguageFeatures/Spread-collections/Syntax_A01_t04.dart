/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We extend the list grammar to allow spread elements in addition to
 * regular elements:
 * listLiteral:
 *   const? typeArguments? '[' spreadableList? ']'
 *   ;
 *
 *   spreadableList:
 *   spreadableExpression ( ',' spreadableExpression )* ','?
 *   ;
 *
 *   spreadableExpression:
 *   expression |
 *   spread
 *   ;
 *
 *   spread:
 *   ( '...' | '...?' ) expression
 *   ;
 *
 * Instead of [expressionList], this uses a new [spreadableList] rule since
 * [expressionList] is used elsewhere in the grammar where spreads aren't
 * allowed. Each element in a list is either a normal expression or a spread
 * element. If the spread element starts with [...?], it's a null-aware spread
 * element.
 * @description Checks that [spreadableList] can not be declared as constant if
 * spreadable element is not a constant.
 * @author iarkh@unipro.ru
 */

main() {
  List list1 = ["abc", "int", "hello"];
  List list2;
  int i;

  List a = const [...list2];                                       //# 01: compile-time error
  a = const ["testme", ...list2];                                  //# 02: compile-time error
  a = const [...list2, "testme"];                                  //# 03: compile-time error
  a = const ["abc", ...list1, "int", "hello", 1, ...list2, 2, 12]; //# 04: compile-time error
  a = const [...list1, i];                                         //# 05: compile-time error
}
