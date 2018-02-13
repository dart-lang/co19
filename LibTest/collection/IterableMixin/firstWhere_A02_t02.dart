/*
 * Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E firstWhere(bool test(E value), { E orElse() })
 * Iterates through elements and returns the first to satisfy [test].
 * @description Checks that all the iterable elements are processed in correct
 * order if no one meets the [test] conditions.
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

List iterated = [];

bool test1(var value) {
  iterated.add(value);
  return value < 0;
}

bool test2(dynamic value) {
  iterated.add(value);
  return false;
}

check(List list, bool test(value)) {
  iterated.clear();
  MyIterable iterable = new MyIterable(list);
  try {
    iterable.firstWhere(test);
  } catch (exception) {};
  Expect.listEquals(list, iterated);
}

main() {
  check([1, 2, 128, 33, 0, 5, 14, 0, 12, 126, 6], test1);
  check([1, 2, 128, 33, 0, "testme", new Object(), null], test2);
  check([], test1);
  check([], test2);
}
