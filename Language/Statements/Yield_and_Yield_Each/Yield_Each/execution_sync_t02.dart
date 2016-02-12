/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a statement s of the form yield* e; proceeds as
 * follows:
 *    First, the expression e is evaluated to an object o.
 *    If the immediately enclosing function m is marked sync*, then:
 * 1. It is a dynamic error if the class of o does not implement Iterable.
 * Otherwise
 * 2. The method iterator is invoked upon o returning an object i.
 * 3. The moveNext method of i is invoked on it with no arguments. If moveNext
 * returns false execution of s is complete. Otherwise
 * 4. The getter current is invoked on i. If the invocation raises an
 * exception ex, execution of s throws ex. Otherwise, the result x of the
 * getter invocation is added to the iterable associated with m. Execution of
 * the function m immediately enclosing s is suspended until the nullary method
 * moveNext() is invoked upon the iterator used to initiate the current
 * invocation of m, at which point execution of s continues at 3.
 * 5. The current call to moveNext() returns true.
 *
 * @description Check that method iterator is invoked upon o
 *
 * @author a.semenov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class IterableWrapper<E> extends Iterable<E> {

  int _iteratorCallCount;
  Iterable<E> _iterable;

  IterableWrapper(Iterable<E> iterable) {
    _iterable = iterable;
    _iteratorCallCount = 0;
  }

  Iterator<E> get iterator {
    _iteratorCallCount++;
    return _iterable.iterator;
  }

  int get iteratorCallCount => _iteratorCallCount;
}

Iterable generator(Iterable iterable) sync* {
  yield* iterable;
}

main() {
  IterableWrapper<int> it1 = new IterableWrapper<int>([1]);
  Expect.equals(1, generator(it1).first);
  Expect.equals(1, it1.iteratorCallCount);

  IterableWrapper<String> it2 = new IterableWrapper<String>(['a', 'b']);
  Expect.equals('a', generator(it2).first);
  Expect.equals(1, it2.iteratorCallCount);
  Expect.equals('b', generator(it2).last);
  Expect.equals(2, it2.iteratorCallCount);
}
