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
 * @description Check that execution of the function m immediately enclosing
 * s is suspended until the nullary method moveNext() is invoked upon the
 * iterator used to initiate the current invocation of m
 *
 * @author a.semenov@unipro.ru
 */
import '../../../../Utils/expect.dart';

Iterable<int> generator(List log) sync* {
  int code = 'a'.codeUnitAt(0);
  for (int i = 0; i < 3; i++) {
    yield i;
    String s = new String.fromCharCode(code + i);
    log.add(s);
  }
}

main() {
  List log = [];
  Iterable<int> iterable = generator(log);
  Iterator<int> it = iterable.iterator;
  while (it.moveNext()) {
    log.add(it.current);
  }
  Expect.listEquals([0, 'a', 1, 'b', 2, 'c'], log);
}
