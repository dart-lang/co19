/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> take(int count)
 * The [count] must not be negative.
 * @description checks that an Error is thrown if n is negative.
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
  Expect.throws(() { iterable.take(n); }, (e) => e is Error);
}

main() {
  check([1, 2, -3, 4], -1);
  check(const[1, 2, -5, -6, 100], -1);
  check(const[null, 2, -5, -6, 100], -1000);
}
