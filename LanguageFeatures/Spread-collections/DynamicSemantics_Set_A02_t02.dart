/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A [set] literal [<E>{elem_1 ... elem_n}] is evaluated as follows:
 *   2. For each element in the [set] literal:
 *      i. Evaluate the element's expression to a value value.
 *      ii. If element is a spread element:
 *          a. If element is null-aware and value is [null], continue to the
 *             next element in the literal.
 *          b. Evaluate [value.iterator] to a [value] iterator.
 *          c. Loop:
 *             a. If [iterator.moveNext()] returns [false], exit the loop.
 *             b. Evaluate set.add(iterator.current).
 *       iii. Else:
 *           a. Evaluate [set.add(value)].
 * @description Checks that elements in the spread element are added to the
 * result set in correct order.
 * @author iarkh@unipro.ru
 */

import "dart:collection";
import "../../Utils/expect.dart";

class MyIterable extends IterableBase {
  MyIterator iterator;

  MyIterable(Set set) { iterator = new MyIterator(set); }

  Iterator getIterator() { return iterator; }
}

class MyIterator extends Iterator {
  int i = -1;
  List list;

  MyIterator(Set set) { list = set.toList(); }

  @override
  bool moveNext() { return ++i < list.length; }

  @override
  dynamic get current { return list[i]; }
}

List mySets = [{1, 2, 3, 4, 5},
  {"a", "14", 1, 2, null, 143, [11]},
  {1, 2, {}, [123,4], 14},
  {[], [11], 12345},
  {1, 2, 3, 4, 5, 6, 7, 8, 9},
  ];

main() {
  mySets.forEach((var set) {
    MyIterable it = new MyIterable(set);
    Expect.setEquals(set, {...it});
    Expect.isFalse(it.getIterator().moveNext());
  });
}
