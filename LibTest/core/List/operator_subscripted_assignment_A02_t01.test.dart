// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion  abstract void operator []=(int index, E value)
/// Throws a RangeError if index is out of bounds.
/// @description Checks that the exception is thrown, for fixed size and growable
/// arrays.
/// @author iefremov
/// @author varlax

library operator_subscripted_assignment_A02_t01;

import "../../../Utils/expect.dart";

test(List<E> create<E>([int length, E fill])) {

  void check(List a0, int idx) {
    List a = create(a0.length, 0);
    a.setRange(0, a0.length, a0);
    Expect.throws(() {a[idx] = null;}, (e) => e is RangeError);
  }

  check([], 0);
  check([], 1);
  check([], -1);
  check(new List.empty(), 6031769);
  check(new List.filled(123, 0), 6031769);
  check([1], 2);
  check([null, null, null, null], 5);
  check([null, null, null, null], -1);
}
