/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Iterable map(dynamic f(E element))
 * Returns a new lazy [Iterable] with elements that are created by calling [f]
 * on each element of this [Iterable] in iteration order.
 * This method returns a view of the mapped elements.
 * @description Checks that the resulting [Iterable] contains all the results of
 * [f(e)].
 * @author iarkh@unipro.ru
 */

import "dart:collection";
import "../../../Utils/expect.dart";

class MyIterable extends Object with IterableMixin {
  List _content;
  MyIterable(List list): _content = list;

  Iterator get iterator {
    return _content.iterator;
  }
}

f(var element) {
  return [element];
}

void check(List list) {
  IterableMixin iterable = new MyIterable(list);

  int count = 0;
  Iterable res = iterable.map(f);
  for (var x in res) {
    Expect.listEquals(f(iterable.elementAt(count)), x);
    count++;
  }
  Expect.equals(iterable.length, count);
}

main() {
  check([]);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]);
  check([-7, null, "testme", "testme12345", new Error(), 1, 1, 1, 2, 3, ""]);
}
