/*
 * Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E firstWhere(bool test(E value), { E orElse() })
 * If no element satisfies [test], the result of invoking the [orElse] function
 * is returned.
 * @description Checks that [orElse] is not called if there are elements which
 * satisfy [test] conditions.
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

check(List list) {
  MyIterable iterable = new MyIterable(list);
  iterable.firstWhere((value) => value is int && value > 0,
      orElse: () { Expect.fail("Should not get to orElse!"); });
}

main() {
  check([1, 2, -3, 4, 128]);
  check([1, 2, 128, "testme", 33, 0, new Object(), [], 0, 0]);
}
