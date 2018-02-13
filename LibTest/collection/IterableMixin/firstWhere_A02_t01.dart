/*
 * Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E firstWhere(bool test(E value), { E orElse() })
 * Iterates through elements and returns the first to satisfy [test].
 * @description Checks that all the iterable elements are processed in correct
 * order while one does not meet the [test] conditions.
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
  return value > 1;
}

bool test2(var value) {
  iterated.add(value);
  return value == 0;
}

bool test3(var value) {
  iterated.add(value);
  return value == 1254;
}

check(List list, bool test(value), List expected) {
  iterated.clear();
  MyIterable iterable = new MyIterable(list);
  iterable.firstWhere(test);
  Expect.listEquals(expected, iterated);
}

main() {
  check([1, 2, -3, 4, 128], test1, [1, 2]);
  check([1, 2, 128, 33, 0, -5, 14, 0, -12, 126, -6], test2, [1, 2, 128, 33, 0]);
  check([1, 2, 128, 33, -5, 14, 0, -12, 126, -6], test2,
      [1, 2, 128, 33, -5, 14, 0]);

  List tryme = [1, "testme", -1, 0, new Object(), null, 1254];
  check(tryme, test3, tryme);
}
