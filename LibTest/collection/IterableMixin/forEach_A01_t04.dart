// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion  void forEach(void f(E element))
/// Applies the function [f] to each element of this collection in iteration
/// order.
/// @description Checks that [forEach()] iterates elements in correct iteration
/// order.
/// @author iarkh@unipro.ru

import "dart:collection";
import "../../../Utils/expect.dart";

class MyIterable extends Object with IterableMixin {
  List _content;
  MyIterable(List list): _content = list;

  Iterator get iterator {
    return _content.iterator;
  }
}

check(List list, num init, combine, num expected) {
  IterableMixin iterable = new MyIterable(list);
  num actual = iterable.fold(init, combine);
  Expect.equals(expected, actual);
}	

main() {
  List list = [];
  List result = new List.filled(100, null);
  for(int i = 0; i < 100; i++) {
    list.add(i);
  }
  IterableMixin iterable = new MyIterable(list);

  int i = 0;
  iterable.forEach((var element) {
    result[i++] = element;
  });

  Expect.listEquals(list, result);
}
