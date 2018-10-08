/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> takeWhile(bool test(E value))
 * Every new iterator of the returned iterable starts iterating over the
 * elements of this.
 * @description Checks that every new iterator starts iterating over the
 * elements of this.
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

void check(List list, bool test0(var element)) {
  IterableMixin iterable = new MyIterable(list);
  var el;

  bool test(var element) {
    if(test0(element)) {
      el = element;
      return true;
    } else {
      return false;
    }
  }
  
  Iterable res = iterable.takeWhile(test);
  
  for (int k = 0; k < 5; k++) {
    Iterator it = res.iterator;
    int i = 0;
    while (it.moveNext()) {
      Expect.equals(list[i], el);
      Expect.equals(el, it.current);
      i++;
    }  
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
