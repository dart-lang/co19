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
 * @description Checks that spreadable element can have type argument
 */
// SharedOptions=--enable-experiment=spread-collections

import "../../Utils/expect.dart";

main() {
  List<int> list1 = [1, 2, 3];
  List<String> list2 = ["a"];
  List<int> list3 = [0, 2, 4, 6, 8];

  List a;
  Expect.listEquals([1, 2, 3], <int>[...list1]);
  Expect.listEquals([1, 2, 3, 12], <int>[...list1, 12]);
  Expect.listEquals([12, 1, 2, 3], <int>[12, ...list1]);

  a = <String>[...list1];                  //# 01: compile-error
  a = <String>["123", ...list1];           //# 02: compile-error
  a = <String>[...list1, "123"];           //# 03: compile-error
  a = <int>[...list1, "123"];              //# 04: compile-error
  a = <int>["123", list1];                 //# 05: compile-error
  a = <int>[...list1, ...list2, ...list3]; //# 06: compile-error
}
