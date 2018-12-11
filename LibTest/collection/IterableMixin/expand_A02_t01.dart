/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<T> expand <T>(Iterable<T> f(E element))
 * The resulting [Iterable] runs through the elements returned by [f] for each
 * element of this, in iteration order.
 * The returned [Iterable] is lazy, and calls [f] for each element of this
 * every time it's iterated.
 * @description Checks that all the elements are lazily processed in iteration
 * order.
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

main() {
  List res = [];
  List original = [1, 3, 9, 4, 16, -24, 6, 6, 6];
  MyIterable iterable = new MyIterable(original);
  Iterable list = iterable.expand((var element) {
    res.add(element);
    return [element, -element];
  });
  Expect.equals(original.length * 2, list.length);
  Expect.listEquals(original, res);
}
