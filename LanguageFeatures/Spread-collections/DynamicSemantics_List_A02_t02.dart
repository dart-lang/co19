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
 * @description Checks that elements in the spread element are added to the
 * result list in correct order.
 * @author iarkh@unipro.ru
 */

import "dart:collection";
import "../../Utils/expect.dart";

class MyIterable extends IterableBase {
  MyIterator iterator;

  MyIterable(List list) { iterator = new MyIterator(list); }

  Iterator getIterator() { return iterator; }
}

class MyIterator extends Iterator {
  int i = -1;
  List list;

  MyIterator(List aList) { list = aList; }

  @override
  bool moveNext() { return ++i < list.length; }

  @override
  dynamic get current { return list[i]; }
}

List myLists = [[1, 2, 3, 4, 5],
  ["a", "14", 1, 2, null, 143, [11]],
  [1, 2, {}, [123,4], 14],
  [[], [], 12345],
  [1, 2, 3, 4, 5, 6, 7, 8, 9],
  []];

main() {
  myLists.forEach((var list) {
    MyIterable it = new MyIterable(list);
    Expect.listEquals(list, [...it]);
    Expect.isFalse(it.getIterator().moveNext());
  });
}
