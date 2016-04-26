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
 * @description Check that each iterator runs with its own shallow copies of
 * all local variables.
 *
 * @author a.semenov@unipro.ru
 */

import '../../../Utils/expect.dart';

const int COUNT = 100;

class A {
  int a = 0;
}

Iterable generator() sync* {
  A a = new A();
  while ( a.a < COUNT ) {
    yield a.a++;
  }
}

// first iterator is running two times faster than second
test1() {
  Iterable iterable = generator();
  Iterator iterator1 = iterable.iterator;
  Iterator iterator2 = iterable.iterator;
  int k = 0;
  int i = 0;
  while ( i < COUNT/2 ) {
    Expect.isTrue(iterator1.moveNext());
    Expect.equals(k++, iterator1.current);

    Expect.isTrue(iterator2.moveNext());
    Expect.equals(i++, iterator2.current);

    Expect.isTrue(iterator1.moveNext());
    Expect.equals(k++, iterator1.current);
  }
  Expect.isFalse(iterator1.moveNext());
  Expect.isNull(iterator1.current);

  while ( i < COUNT ) {
    Expect.isTrue(iterator2.moveNext());
    Expect.equals(i++, iterator2.current);
  }

  Expect.isFalse(iterator1.moveNext());
  Expect.isNull(iterator1.current);
  Expect.isFalse(iterator2.moveNext());
  Expect.isNull(iterator2.current);
}

// five iterators, each has its own speed
test2() {
  Iterable iterable = generator();
  List<Iterator> iterator = [
    iterable.iterator,
    iterable.iterator,
    iterable.iterator,
    iterable.iterator,
    iterable.iterator
  ];
  List<int> expected = [ 0, 0, 0, 0, 0 ];
  List<int> speed = [ 1, 2, 3, 4, 5 ];

  for (int n = 0; n < COUNT; n++) {
    for (int i = 0; i < iterator.length; i++) {
      Iterator it = iterator[i];
      for (int k = 0; expected[i] < COUNT && k < speed[i]; k++) {
        Expect.isTrue(it.moveNext());
        Expect.equals(expected[i]++, it.current);
      }
    }
  }
  for (int i = 0; i < iterator.length; i++) {
    Expect.isFalse(iterator[i].moveNext());
    Expect.isNull(iterator[i].current);
  }
}

main() {
  test1();
  test2();
}
