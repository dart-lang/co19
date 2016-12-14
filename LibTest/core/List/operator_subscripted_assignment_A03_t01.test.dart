/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void operator []=(int index, E value)
 * Throws an [Error] if [index] is [:null:] or invalid.
 * @description Checks that the exception is thrown, for fixed size and growable
 * arrays.
 * @author kaigorodov
 */
library operator_subscripted_assignment_A03_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {
  List a = create(1);

  void check(var idx) {
    Expect.throws(() {a[idx] = new Object();}, (e) => e is Error);
  }

  check('0');
  check(2.1);
  check([]);
}
