/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E operator [](int index)
 * Throws [Error] if [index] is of invalid type.
 * @description Checks that the exception is thrown as expected.
 * @author varlax
 */
library operator_subscript_A03_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {

  void check(List a0, var idx) {
    List a = create(a0.length);
    a.setRange(0, a0.length, a0);
    Expect.throws(() {a[idx];}, (e) => e is Error);
  }

  check(const [null], 0.0);
  check(['sd', 'sd'], 'sd');
  check(new List.from(<int>[null, 1, 0]), true);
  check(new List(100), {"a": 0});
  check(new List(100), []);
}
