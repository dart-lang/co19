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
 * @description Check that each iterator has the same initial arguments, even
 * if their bindings are modified by the function
 *
 * @author a.semenov@unipro.ru
 */

import '../../../Utils/expect.dart';

Iterable generator(int x) sync* {
  yield x++;
  yield x++;
  yield x++;
  yield x++;
}

test1() {
  Iterable iterable = generator(0);
  Iterator iterator1 = iterable.iterator;
  Iterator iterator2 = iterable.iterator;

  Expect.isTrue(iterator1.moveNext());
  Expect.equals(0, iterator1.current);

  Expect.isTrue(iterator1.moveNext());
  Expect.equals(1, iterator1.current);

  Expect.isTrue(iterator2.moveNext());
  Expect.equals(0, iterator2.current);

  Expect.isTrue(iterator2.moveNext());
  Expect.equals(1, iterator2.current);

  Expect.isTrue(iterator2.moveNext());
  Expect.equals(2, iterator2.current);

  Expect.isTrue(iterator2.moveNext());
  Expect.equals(3, iterator2.current);

  Expect.isTrue(iterator1.moveNext());
  Expect.equals(2, iterator1.current);

  Expect.isTrue(iterator1.moveNext());
  Expect.equals(3, iterator1.current);

  Expect.isFalse(iterator1.moveNext());
  Expect.isNull(iterator1.current);
  Expect.isFalse(iterator2.moveNext());
  Expect.isNull(iterator2.current);
}

Iterable generator2(int x, String y, double z) sync* {
  yield x;
  yield y;
  yield z;
  int t = x;
  x = int.parse(y);
  y = z.toString();
  z = t.toDouble();
  yield x;
  yield y;
  yield z;
}

List take(Iterator iterator, int count) {
  List result = [];
  while (count-- > 0 && iterator.moveNext()) {
    result.add(iterator.current);
  }
  return result;
}

test2() {
  Iterable iterable = generator2(1, "2", 3.14);
  Iterator iterator1 = iterable.iterator;
  Iterator iterator2 = iterable.iterator;
  Iterator iterator3 = iterable.iterator;

  Expect.listEquals([1, "2", 3.14], take(iterator1, 3));
  Expect.listEquals([1, "2", 3.14], take(iterator2, 3));
  Expect.listEquals([2, "3.14", 1], take(iterator1, 3));
  Expect.listEquals([1, "2", 3.14], take(iterator3, 3));
  Expect.listEquals([2, "3.14", 1], take(iterator2, 3));
  Expect.listEquals([2, "3.14", 1], take(iterator3, 3));

  Expect.isFalse(iterator1.moveNext());
  Expect.isNull(iterator1.current);
  Expect.isFalse(iterator2.moveNext());
  Expect.isNull(iterator2.current);
  Expect.isFalse(iterator3.moveNext());
  Expect.isNull(iterator3.current);
}

main() {
  test1();
  test2();
}
