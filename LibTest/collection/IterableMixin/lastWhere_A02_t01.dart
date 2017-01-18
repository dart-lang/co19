/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E lastWhere(bool test(E value), { E orElse() })
 * If no element satisfies [test], the result of invoking the [orElse] function
 * is returned.
 * @description Checks that result of [orElse] is returned if there is no any
 * element meets tha [test] conditions.
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

class TestException {}

check(List list) {
  IterableMixin iterable = new MyIterable(list);
  Expect.throws(() {
    iterable.lastWhere((Object value) => false, orElse: () {
      throw new TestException();
    });
  },
      (e) => e is TestException
  );
}

main() {
  check([1, 2, -3, 4, 0]);
  check(const[1, 2, -5, -6]);
  check([null, 1, 2, 3, -1, new Error(), [1, 2, 3]]);
}
