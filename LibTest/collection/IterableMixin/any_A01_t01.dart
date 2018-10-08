/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  bool any(bool f(E element))
 * Checks whether any [element] of this iterable satisfies [test].
 * Checks every [element] in iteration order, and returns [true] if any of them
 * make [test] return [true], otherwise returns [false].
 * @description Checks the [Iterable] which contains all the elements with the
 * same value.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

class TestIterator implements Iterator<int> {
  int limit = 0;
  int _current = 0;

  TestIterator(this.limit);

  bool moveNext() {
    if (_current < limit) {
      _current++;
      return true;
    } else {
      return false;
    }
  }

  get current => 15;
}

class MyIterable extends Object with IterableMixin {
  int _limit;
  MyIterable(this._limit);
  Iterator get iterator {
    return new TestIterator(_limit);
  }
}

main() {
  Expect.isTrue(new MyIterable(1).any((e) => e == 15));
  Expect.isTrue(new MyIterable(100).any((e) => e == 15));
  Expect.isFalse(new MyIterable(1).any((e) => e == 123));
}
