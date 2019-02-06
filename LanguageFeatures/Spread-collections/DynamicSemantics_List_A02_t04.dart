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
 * @description Checks that elements are added to the result list in correct
 * order.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=spread-collections

import "dart:collection";
import "../../Utils/expect.dart";

class MyIterable extends IterableBase {
  MyIterator iterator;
  MyIterable(List list) { iterator = new MyIterator(list); }
  Iterator getIterator() { return iterator; }
}

class MyIterator extends Iterator {
  int i = 0;
  List list;

  MyIterator(List aList) { list = aList; }

  @override
  bool moveNext() {
    if (i < list.length) {
      i++;
      return true;
    } else {
      return false;
    }
  }

  @override
  int get current { return list[i]; }
}

Iterable it1 = new MyIterable([1, 2, 3, 4, 5]);
Iterable it2 = new MyIterable(["a", "14", "1", "2", null, 143, [11]]);
Iterable it3 = [100, 200, {}, [123,4], 300];
Iterable it4 = [];
Iterable it5 = null;

main() {
  Expect.listEquals(
      [-1, -2, -3, 1, 2, 3, 4, 5, 6, 7], [-1, -2, -3, ...it1, 6, 7]);
  Expect.listEquals(
      [-1, -2, -3, 1, 2, 3, 4, 5, 6, 7], [-1, -2, -3, ...?it1, 6, 7]);
  Expect.listEquals([1, 2, 3], [1, ...it4, 2, ...?it4, 3, ...?it5]);
  Expect.listEquals([-9, -8, 1, 2, 3, 4, 5, -7, "a", "14", "1", "2", null, 143,
          [11], -6, 100, 200, {}, [123,4], 300, -5, -4, -3, -2],
      [-9, -8, ...it1, -7, ...?it2, -6, ...it3, -5, -4, ...it4, -3, -2]);
}
