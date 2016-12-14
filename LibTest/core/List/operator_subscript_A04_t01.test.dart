/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E operator [](int index)
 * Throws [ArgumentError] if [index] is [:null:].
 * @description Checks that the exception is thrown as expected.
 * @author msyabro
 */
library operator_subscript_A04_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {

  void check(List a0) {
    List a = create(a0.length);
    a.setRange(0, a0.length, a0);
    Expect.throws(() {a[null];}, (e) => e is ArgumentError);
  }

  check(const<String>[null]);
  check([]);
  check(new List());
  check(new List(0));
  check(new List.from([]));
}
