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
 * @description Check that value x, obtained via getter current, is added to
 * the iterable associated with m.
 *
 * @author a.semenov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class IteratorStub extends Iterator<int> {

  int _value = 0;

  @override
  int get current => _value;

  @override
  bool moveNext() {
    _value++;
    return _value<5;
  }
}

class IterableStub extends Iterable<int> {

  Iterator<int> get iterator => new IteratorStub();
}

Iterable generator(Iterable iterable, List log) sync* {
  log.add('before');
  yield* iterable;
  log.add('after');
}

main() {
  List log = [];
  IterableStub its = new IterableStub();
  Iterable g = generator(its, log);
  Iterator i = g.iterator;
  log.add('main');
  while (i.moveNext()) {
    log.add(i.current);
  }
  log.add('finish');
  Expect.listEquals(['main', 'before', 1, 2, 3, 4, 'after', 'finish'], log);
}

