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
 * generator method
 *
 * @author a.semenov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
  Iterable<int> test() sync* {
    yield* 'abcdefghij'.codeUnits;
  }
}

main() {
  int k = 0;
  Iterator<int> i = new A().test().iterator;
  while (i.moveNext()) {
    k++;
  }
  Expect.equals(10, k);
}
