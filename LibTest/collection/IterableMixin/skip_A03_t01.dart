/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Iterable<E> skip(int count)
 * The [count] must not be negative.
 * @description Checks that a [RangeError] is thrown if [count] is negative.
 * @author iarkh@unipro.ru
 */

import "dart:collection";
import "../../../Utils/expect.dart";

class MyIterable<int> extends Object with IterableMixin {
  List _content;
  MyIterable(List list): _content = list;

  Iterator get iterator {
    return _content.iterator;
  }
}

check(List list, int n) {
  IterableMixin iterable = new MyIterable(list);
  Expect.throws(() { iterable.skip(n); }, (e) => e is RangeError);
}

main() {
  check([1, 2, -3, 4], -1);
  check(const[1, 2, -5,-6, 100], -1);
  check(const[null , 2, -5, -6, 100], -1000);
}
