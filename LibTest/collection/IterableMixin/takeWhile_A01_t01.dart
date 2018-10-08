/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> takeWhile(bool test(E value))
 * Returns a lazy iterable of the leading elements satisfying [test]...
 * The elements can be computed by stepping through iterator until an element is
 * found where [test(element)] is [false]. At that point, the returned iterable
 * stops (its [moveNext()] returns [false]).
 * @description Checks that all first elements that satisfy [test] are retained,
 * and elements after are skipped.
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
  Iterator it = list.iterator;
  Iterable res = iterable.takeWhile(test);
  Iterator it_res = res.iterator;

  while(it_res.moveNext()) {
    it.moveNext();
    Expect.isTrue(test(it_res.current));
    Expect.isTrue(test(it.current));
    Expect.equals(it_res.current, it.current);
  }

  if(it.moveNext()) {
    Expect.isFalse(test(it.current));
  }

}

main() {
  List list = [1, 3, 7, 4, 5, 6, 3, 4, 1];
  check(list, (var element) => element == 1);
  check(list, (var element) => true);
  check(list, (var element) => false);
  check(list, (var element) => element > 4);
  check(list, (var element) => element < 4);
  check(list, (var element) => element == 4);
  check(list, (var element) => element < 0);
  check(list, (var element) => element > 10);
  check([], (var element) => true);
  check([], (var element) => false);
}
