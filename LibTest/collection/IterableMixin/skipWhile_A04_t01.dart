/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E value))
 * The returned iterable provides elements by iterating this iterable, but
 * skipping over all initial elements where [test(element)] returns [true]. If
 * all elements satisfy [test] the resulting iterable is empty, otherwise it
 * iterates the remaining elements in their original order, starting with the
 * first element for which [test(element)] returns [false].
 * @description Checks that once an element does not satisfy the [test],
 * the iterator stops testing and uses every element unconditionally.
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

void check(List list, bool test(var element)) {
  IterableMixin iterable = new MyIterable(list);
  bool testPassed = null;
  bool test1(var element) {
    Expect.isTrue(testPassed == null || testPassed,
        "testPassed=$testPassed for element=$element");
    return testPassed =! test(element);
  }
  for (var element in iterable.skipWhile(test1)) {
    Expect.isTrue(testPassed == null || !testPassed);
  }  
}

main() {
  List list = [1, 3, 7, 4, 5, 6];
  check(list, (var element) => element == 1);
  check(list, (var element) => true);
  check(list, (var element) => false);
  check(list, (var element) => element > 4);
  check(list, (var element) => element < 4);
  check(list, (var element) => element == 4);
}
