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
 * @description Check that if e is 'throw exception', then await expression
 * throws the same exception.
 *
 * @author a.semenov@unipro.ru
 */
import '../../../Utils/expect.dart';

final Exception E1 = new Exception("1");

test() async {
  try {
    await (throw E1);
    Expect.fail('await expression should throw ' + E1.toString());
  } catch (x) {
    Expect.identical(E1, x);
  }
}

main() {
  asyncStart();
  test().then((value) => asyncEnd());
}
