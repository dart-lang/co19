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
 * @description Checks that spreadable element can be null-aware
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

main() {
  List list1 = null;
  List list2 = [14, 18, 99];
  List list3 = [0, 2, 4, 6, 8];

  List a;

  Expect.listEquals([], [...?list1]);
  Expect.throws(() => a = [...list1]);

  Expect.listEquals([12], [12, ...?list1]);
  Expect.throws(() => a = [12, ...list1]);

  Expect.listEquals([12], [...?list1, 12]);
  Expect.throws(() => a = [...list1, 12]);

  Expect.listEquals([14, 18, 99, 0, 2, 4, 6, 8],
      [14, 18, 99, ...?list1, 0, 2, 4, 6, 8]);
  Expect.throws(() => a = [...list2, ...list1, ...list3]);
}
