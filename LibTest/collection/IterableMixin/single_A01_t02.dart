/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool single
 * @description Checks that [single] returns [true] if there is one element in
 * the iterable and [false] otherwise.
 * @author irina.arkhipets@gmail.com
 */
import "../../../Utils/expect.dart";
import "dart:collection";

class NaturalIterator implements Iterator<int> {
  int limit;
  int _current = 0;

  NaturalIterator(this.limit);

  bool moveNext() {
    if (_current < limit) {
      _current++;
      return true;
    } else {
      return false;
    }
  }

  int get current => _current;
}

class MyIterable extends Object with IterableMixin {
  int _limit;

  MyIterable(this._limit);

  Iterator<int> get iterator {
    return new NaturalIterator(_limit);
  }
}

main() {
  Expect.isFalse(new MyIterable(0).single);
  Expect.isFalse(new MyIterable(10).single);
  Expect.isFalse(new MyIterable(150).single);
  Expect.isTrue(new MyIterable(1).single);
}