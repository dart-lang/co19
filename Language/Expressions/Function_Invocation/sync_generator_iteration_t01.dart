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
 * @description Check that body of synchronous generator is executed only
 * after call to method Iterator.moveNext()
 *
 * @author a.semenov@unipro.ru
 */

import '../../../Utils/expect.dart';

bool body1Executed = false;

Iterable generator1() sync* {
  body1Executed = true;
}

test1() {
  Iterable iterable = generator1();
  Expect.isFalse(body1Executed);
  Iterator iterator = iterable.iterator;
  Expect.isFalse(body1Executed);
  Expect.isFalse(iterator.moveNext());
  Expect.isTrue(body1Executed);
}

bool body2Executed = false;

Iterable generator2() sync* {
  body2Executed = true;
  yield 1;
}

test2() {
  Iterable iterable = generator2();
  Expect.isFalse(body2Executed);
  Iterator iterator = iterable.iterator;
  Expect.isFalse(body2Executed);
  Expect.isTrue(iterator.moveNext());
  Expect.isTrue(body2Executed);
}

List<bool> body3Executed = [false, false, false, false];

Iterable generator3() sync* {
  body3Executed[0] = true;
  yield 1;
  body3Executed[1] = true;
  yield 2;
  body3Executed[2] = true;
  yield 3;
  body3Executed[3] = true;
}

test3() {
  Iterable iterable = generator3();
  Expect.listEquals([false, false, false, false], body3Executed);
  Iterator iterator = iterable.iterator;
  Expect.listEquals([false, false, false, false], body3Executed);

  Expect.isTrue(iterator.moveNext());
  Expect.listEquals([true, false, false, false], body3Executed);
  Expect.equals(1, iterator.current);

  Expect.isTrue(iterator.moveNext());
  Expect.listEquals([true, true, false, false], body3Executed);
  Expect.equals(2, iterator.current);

  Expect.isTrue(iterator.moveNext());
  Expect.listEquals([true, true, true, false], body3Executed);
  Expect.equals(3, iterator.current);

  Expect.isFalse(iterator.moveNext());
  Expect.listEquals([true, true, true, true], body3Executed);
}

main() {
  test1();
  test2();
  test3();
}
