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
 *    If the enclosing function m is marked async* and the stream u associated
 *  with m has been canceled, then let c be the finally clause (17.11) of the
 *  innermost enclosing try-finally statement, if any. If c is defined, let h be
 *  the handler induced by c. If h is defined, control is transferred to h. If
 *  h is undefined, the immediately enclosing function terminates.
 *    The stream associated with an asynchronous generator could be canceled by
 *  any code with a reference to that stream at any point where the generator
 *  was passivated. Such a cancellation constitutes an irretrievable error for
 *  the generator. At this point, the only plausible action for the generator
 *  is to clean up after itself via its finally clauses.
 *    Otherwise, if the enclosing function m is marked async* (9) then the
 *  enclosing function may suspend.
 *
 * @description Check that the immediately enclosing function m may suspend
 * to give an opportunity for asynchronous consumers to drain the stream.
 *
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../../Utils/expect.dart';

bool finish = false;

Stream<int> generator() async* {
  int i = 0;
  while (!finish) {
    yield i++;
  }
}

test() async {
  finish = false;
  Stream<int> s = generator();
  s.listen(
      (int x) async {
        finish = (x > 10);  // let generator to work some time
      },
      onDone: () {
        asyncEnd();
      }
  );
}

main() {
  asyncStart();
  test();
}
