/*
 * Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E firstWhere(bool test(E value), { E orElse() })
 * If [orElse] is omitted, it defaults to throwing a StateError.
 * @description Checks that the result of [orElse] is returned if no elements
 * satisfies [test].
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

class TestException {}

check(List list) {
  MyIterable iterable = new MyIterable(list);
  Expect.throws(() {
     iterable.firstWhere((value) => false);
     }, (e) => e is StateError);
  }

main() {
  check([1, 2, -3, 4, 128]);
  check([1, 2, 128, "testme", 33, 0, new Object(), [], 0, 0]);
  check([]);
}
