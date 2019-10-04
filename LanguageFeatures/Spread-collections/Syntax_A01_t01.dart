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
 * @description Checks the very simple cases where some values are combined with
 * the existing list of integers
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

main() {
  List list1 = [1, 2, 3];
  List list2 = [14, 18, 99];
  List list3 = [0, 2, 4, 6, 8];

  Expect.listEquals([1, 2, 3, 12], [...list1, 12]);
  Expect.listEquals([12, 1, 2, 3], [12, ...list1]);

  Expect.listEquals([1, 2, 3, 12, 2, 3, 10], [...list1, 12, 2, 3, 10]);

  Expect.listEquals([1, 2, 3, 14, 18, 99, 0, 2, 4, 6, 8],
      [...list1, ...list2, ...list3]);
  Expect.listEquals([11, 1, 2, 3, 12, 16, 94, 0, 2, 4, 6, 8],
      [11, ...list1, 12, 16, 94, ...list3]);

  Expect.listEquals([1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3],
      [...list1, ...list1, ...list1, ...list1, ...list1, ...list1]);

  Expect.listEquals([1, 2, 3], [...list1]);

}
