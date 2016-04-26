/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion When iteration over the iterable is started, by getting an
 * iterator j from the iterable and calling moveNext(), execution of the body
 * of f will begin. When f terminates, j is positioned after its last element,
 * so that its current value is null and the current call to moveNext() on j
 * returns false, as will all further calls.
 *    Each iterator starts a separate computation. If the sync* function is
 * impure, the sequence of values yielded by each iterator may differ.
 *    One can derive more than one iterator from a given iterable. Note that
 * operations on the iterable itself can create distinct iterators. An example
 * would be length. It is conceivable that different iterators might yield
 * sequences of different length. The same care needs to be taken when writing
 * sync* functions as when writing an Iterator class. In particular, it should
 * handle multiple simultaneous iterators gracefully. If the iterator depends
 * on external state that might change, it should check that the state is still
 * valid after every yield (and maybe throw a ConcurrentModificationError if
 * it isn’t).
 *    Each iterator runs with its own shallow copies of all local variables; in
 * particular, each iterator has the same initial arguments, even if their
 * bindings are modified by the function. Two executions of an iterator
 * interact only via state outside the function.
 *
 * @description Check that j is positioned after its last element, j.current
 * is null and j.moveNext() returns false, when f terminates.
 *
 * @author a.semenov@unipro.ru
 */

import '../../../Utils/expect.dart';

Iterable generator1() sync* {
}

test1() {
  Iterable iterable = generator1();
  Iterator iterator = iterable.iterator;
  for (int i = 0; i < 10; i++) {
    Expect.isFalse(iterator.moveNext());
    Expect.isNull(iterator.current);
  }
}

Iterable generator2() sync* {
  yield 1;
}

test2() {
  Iterable iterable = generator2();
  Iterator iterator = iterable.iterator;
  Expect.isTrue(iterator.moveNext());
  Expect.equals(1, iterator.current);
  for (int i = 0; i < 10; i++) {
    Expect.isFalse(iterator.moveNext());
    Expect.isNull(iterator.current);
  }
}

Iterable generator3() sync* {
  for (int i = 0; i < 5; i++) {
    yield i;
  }
}

test3() {
  Iterable iterable = generator3();
  Iterator iterator = iterable.iterator;
  for (int i = 0; i < 5; i++) {
    Expect.isTrue(iterator.moveNext());
    Expect.equals(i, iterator.current);
  }
  for (int i = 0; i < 10; i++) {
    Expect.isFalse(iterator.moveNext());
    Expect.isNull(iterator.current);
  }
}

main() {
  test1();
  test2();
  test3();
}
