/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A list literal <E>[elem_1 ... elem_n] is evaluated as follows:
 *
 * 2. For each element in the list literal:
 *   i. Evaluate the element's expression to a value value.
 *   ii. If element is a spread element:
 *     a. If element is null-aware and value is [null], continue to the next
 *        element in the literal.
 *     b. Evaluate [value.iterator] to a [value] iterator.
 *     c. Loop:
 *        a. If [iterator.moveNext()] returns [false], exit the loop.
 *        b. Evaluate [iterator.current] and append the result to list.
 *   iii. Else:
 *     a. Append value to list.
 *
 * @description Checks that if element is null-aware and it's [null], nothing
 * added to the result list.
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

main() {
  List list1 = [1, 2, 3, 4, 5];
  List list2 = [];
  List list3 = null;
  List list4 = [1 ,2, 3, "checkme"];

  Expect.listEquals([], [...?list3]);
  Expect.listEquals([1, 2, 4], [1, 2, ...?list3, 4]);
  Expect.listEquals([1, 1, 2, 3, "checkme", 1, 2, 3, 4, 5],
      [1, ...?list4, ...?list3, ...list1]);
  Expect.listEquals([], [...?list3, ...?list3, ...?list3]);
  Expect.listEquals([], [...list2, ...?list3]);
}
