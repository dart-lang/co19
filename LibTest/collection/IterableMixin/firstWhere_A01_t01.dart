/*
 * Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E firstWhere(bool test(E value), { E orElse() })
 * Returns the first element that satisfies the given predicate [test].
 * @description Checks that the first element which satisfies [test] is
 * returned.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

class MyIterable extends Object with IterableMixin {
  List _content;
  MyIterable(List list): _content = list;

  Iterator get iterator {
    return _content.iterator;
  }
}

check(List list, bool test(value), int expected) {
  MyIterable iterable = new MyIterable(list);
  int actual = iterable.firstWhere(test);
  Expect.equals(expected, actual);
}

main() {
  check([1, 2, -3, 4, 128], (value) => value > 1, 2);
  check([1, 2, 128, 33, -5, 14, 0, -12, 126, -6], (value) => value < 0, -5);
}
