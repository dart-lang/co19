/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The yield statement adds an element to the result of a generator
 * function.
 *  yieldStatement:
 *    yield expression ‘;’
 *   ;
 *
 * @description Check correct usage of yield statement in asynchronous
 * generator method
 *
 * @author a.semenov@unipro.ru
 */

import 'dart:async';
import '../../../../Utils/expect.dart';

class A {
  Stream<int> test() async* {
    yield 1;
  }
}

main() {
  asyncStart();
  int k = 0;
  new A().test().forEach((int i) => k = k + i).then(
      (_) {
        Expect.equals(1, k);
        asyncEnd();
      }
  );
}
