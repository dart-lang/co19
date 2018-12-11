/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool every(bool f(E element))
 * Checks whether every element of this iterable satisfies test.
 * ... returns [false] if any of them make [test] return [false], otherwise
 * returns [true].
 * @description Checks that [true] is always returned for empty iterable.
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
  MyIterable iterable = new MyIterable([]);
  Expect.isTrue(iterable.every((var element) { return true; }));
  Expect.isTrue(iterable.every((var element) { return element > 0; }));
  Expect.isTrue(iterable.every((var element) { return false; }));
  Expect.isTrue(iterable.every((var element) { return element < 0; }));
  Expect.isTrue(iterable.every((var element) { return element > 4; }));
}
