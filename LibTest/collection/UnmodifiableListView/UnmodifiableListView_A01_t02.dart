/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion UnmodifiableListView(Iterable<E> source)
 * Creates an unmodifiable list backed by [source].
 * The [source] of the elements may be a [List] or any [Iterable] with efficient
 * [Iterable.length] and [Iterable.elementAt].
 * @description Checks that proper unmodifiable list with correct element order
 * is created from the custom iterable [source]
 * @author iarkh@unipro.ru
 */

import "dart:collection";
import "../../../Utils/expect.dart";

class MyIterable extends Object with IterableMixin {
  List _content;
  MyIterable(List list): _content = list;

  Iterator get iterator {
    return _content.iterator;
  }
}

check(Iterable iterable) {
  int i = 0;
  UnmodifiableListView l = new UnmodifiableListView(iterable);
  l.forEach((var element) {
    Expect.equals(l[i++], element);
  });
}

main() {
  check(new MyIterable([]));
  check(new MyIterable([1, 2, 3, 4, 5]));
  check(new MyIterable(["1", "2", 3, null, 5, 0, "test"]));
}
