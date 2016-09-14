/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a statement s of the form yield e; proceeds as
 * follows:
 *    First, the expression e is evaluated to an object o. If the enclosing
 *  function m is marked async* and the stream u associated with m has been
 *  paused, then execution of m is suspended until u is resumed or canceled.
 *    Next, o is added to the iterable or stream associated with the immediately
 *  enclosing function.
 * ...
 * If the enclosing function m is marked sync*  then:
 *   - Execution of the function m immediately enclosing s is suspended until
 *   the nullary method moveNext() is invoked upon the iterator used to initiate
 *   the current invocation of m.
 *   - The current call to moveNext() returns true.
 *
 * @description Check that call to moveNext() upon the iterator, used to
 * initiate the current invocation of m,  returns true
 *
 * @author a.semenov@unipro.ru
 */
import '../../../../Utils/expect.dart';

Iterable<int> generator() sync* {
  yield 1;
}

main() {
  Iterable<int> iterable = generator();
  Iterator<int> it = iterable.iterator;
  Expect.equals(true, it.moveNext());
}
