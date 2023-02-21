// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion abstract E operator [](int index)
/// Throws a RangeError if index is out of bounds.
/// @description Checks that the exception is thrown.
/// @author iefremov
/// @author varlax

library operator_subscript_A02_t01;

import "../../../Utils/expect.dart";

test(List<E> create<E>([int length, E fill])) {

  void check(List a0, int idx) {
    List a = create(a0.length, new Object());
    a.setRange(0, a0.length, a0);
    Expect.throws(() {a[idx];}, (e) => e is RangeError);
  }

  check([], 0);
  check([], 1);
  check([], -1);
  check(const[], 6031769);
  check(const [1], 2);
  check(const [null, null, null, null], 5);
  check(const [null, null, null, null], -1);

  var ls = new List.filled(123, 0);
  check(ls, 124);
  check(ls, -1);

  check(new List.empty(), 0);
  check(new List.empty(), 1);
  check(new List.empty(), -1);
  check(new List.from([]), 6031769);
  check(new List.from([1]), 2);
  check(new List.from([null, null, null, null]), 5);
  check(new List.from([null, null, null, null]), -1);

}

