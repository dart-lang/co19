/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an await expression a of the form await e
 * proceeds as follows: First, the expression e is evaluated. Next:
 * If e raises an exception x, then an instance f of class Future is allocated
 * and later completed with x. ... If f has completed with an exception x,
 * a raises x.
 *
 * @description Check that if e is a call to asynchronous function returning
 * Future instance, which later completes with IntegerDivisionByZeroException,
 * then await expression throws the same exception.
 *
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../Utils/expect.dart';

Future<int> f() async {
  return (1 ~/ 0);
}

test() async {
  try {
    await f();
    Expect.fail('await expression should throw IntegerDivisionByZeroException');
  } catch (x) {
    Expect.isTrue(x is IntegerDivisionByZeroException);
  }
}

main() {
  asyncStart();
  test().then((value) => asyncEnd());
}
