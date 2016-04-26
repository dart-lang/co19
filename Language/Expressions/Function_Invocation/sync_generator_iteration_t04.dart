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
 * @description Check that each returned iterator may return different values.
 *
 * @author a.semenov@unipro.ru
 */

import '../../../Utils/expect.dart';

int generator1Value = 0;

Iterable generator1() sync* {
  yield generator1Value++;
}

test1() {
  Iterable iterable = generator1();
  for (int i = 0; i <= 10; i++) {
    Iterator iterator = iterable.iterator;
    Expect.isTrue(iterator.moveNext());
    Expect.equals(i, iterator.current);
    Expect.isFalse(iterator.moveNext());
  }
}

bool generator2State = false;

Iterable generator2() sync* {
  generator2State = !generator2State;
  if (generator2State) {
    yield 1;
  }
}

test2() {
  Iterable iterable = generator2();
  bool expectNext = true;
  for (int i = 0; i <= 10; i++) {
    Iterator iterator = iterable.iterator;
    Expect.equals(expectNext, iterator.moveNext());
    if (expectNext) {
      Expect.equals(1, iterator.current);
      Expect.isFalse(iterator.moveNext());
    }
    expectNext = !expectNext;
  }
}

List<List<int>> generator3Values = [
  [],
  [1],
  [1, 2, 3],
  [0, 9, 8, 7, 6, 5, 4, 3, 2, 1],
  [-1, -2, -3, -4, -5],
];
int generator3Index = 0;

Iterable generator3() sync* {
  for (int x in generator3Values[generator3Index]) {
    yield x;
  }
  generator3Index++;
  if (generator3Index >= generator3Values.length) {
    generator3Index = 0;
  }
}

test3() {
  Iterable iterable = generator3();
  for (int i = 0; i <= 10; i++) {
    Iterator iterator = iterable.iterator;
    List<int> expectedValues = generator3Values[i%generator3Values.length];
    for (int expectedValue in expectedValues) {
      Expect.isTrue(iterator.moveNext());
      Expect.equals(expectedValue, iterator.current);
    }
    Expect.isFalse(iterator.moveNext());
  }
}

main() {
  test1();
  test2();
  test3();
}
