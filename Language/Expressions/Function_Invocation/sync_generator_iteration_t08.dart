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
 * @description Check that each iterator has the shallow copies of initial
 * arguments
 *
 * @author a.semenov@unipro.ru
 */

import '../../../Utils/expect.dart';

class A {
  int x;

  A(this.x);
}

Iterable generator1(A a) sync* {
  yield a;
}

test1() {
  A a = new A(0);
  Iterable iterable = generator1(a);
  for (int i = 0; i < 10; i++) {
    Iterator it = iterable.iterator;
    Expect.isTrue(it.moveNext());
    Expect.identical(a, it.current);
  }
}

Iterable generator2(A a) sync* {
  yield a.x++;
  yield a.x++;
  yield a.x++;
  yield a.x++;
}

test2() {
  Iterable iterable = generator2(new A(0));
  Expect.listEquals([0,1,2,3], take(iterable.iterator, 4));
  Expect.listEquals([4,5,6,7], take(iterable.iterator, 4));
  Expect.listEquals([8,9,10,11], take(iterable.iterator, 4));
}

List take(Iterator iterator, int count) {
  List result = [];
  while (count-- > 0 && iterator.moveNext()) {
    result.add(iterator.current);
  }
  return result;
}

main() {
  test1();
  test2();
}
