/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<T> expand <T>(Iterable<T> f(E element))
 * Expands each element of this [Iterable] into zero or more elements.
 * @description Checks that empty [Iterable] cannot be expanded.
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
  MyIterable empty = new MyIterable([]);
  Iterable processed = empty.expand((pair) => [12345]);
  Expect.isTrue(processed.isEmpty);
}
