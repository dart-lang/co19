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
 * @description Check that if the invocation of getter current raises an
 * exception ex, execution of s throws ex.
 *
 * @issue #25662
 * @issue #25634
 * @author a.semenov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class TestException {
}

class IteratorStub extends Iterator<int> {

  @override
  int get current => throw new TestException();

  @override
  bool moveNext() => true;
}

class IterableStub extends Iterable<int> {

  Iterator<int> get iterator => new IteratorStub();
}

var actualException;

Iterable generator(Iterable iterable) sync* {
  try {
    yield* iterable;
  } catch (x) {
    actualException = x;
  }
}

main() {
  IterableStub its = new IterableStub();
  Expect.isTrue(generator(its).first);
  Expect.isTrue(actualException is TestException);
}

