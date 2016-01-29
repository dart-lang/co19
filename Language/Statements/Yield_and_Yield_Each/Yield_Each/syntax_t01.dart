/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The yield-each statement adds a series of values to the result
 * of a generator function.
 *  yieldEachStatement:
 *    yield* expression ‘;’
 *  ;
 *
 * @description Check correct usage of yield-each statement in synchronous
 * generator function
 *
 * @author a.semenov@unipro.ru
 */
import '../../../../Utils/expect.dart';

Iterable<int> test() sync* {
  yield* [0,1,2,3,4,5,6,7,8,9];
}

main() {
  int k = 0;
  Iterator<int> i = test().iterator;
  while (i.moveNext()) {
    k++;
  }
  Expect.equals(10, k);
}
