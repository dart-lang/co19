// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion E elementAt(int index)
/// Returns the indexth element.
/// The index must be non-negative and less than length. Index zero represents
/// the first element (so iterable.elementAt(0) is equivalent to iterable.first).
/// May iterate through the elements in iteration order, skipping the first index
/// elements and returning the next. Some iterable may have more efficient ways
/// to find the element.
/// @description Checks that a RangeError is thrown if this list has fewer than
/// index elements.
/// @author kaigorodov

library elementAt_A02_t01;

import "../../../Utils/expect.dart";

var v;

void check (Iterable a, int index) {
  Expect.throws(() {v = a.elementAt(index);}, (e) => e is RangeError );
}

test(Iterable create([Iterable content])) {
  List a = [5, 4, 3, 2, 1, 0];
  check(create(a), -1);
  check(create(a), a.length);
  check(create(a), a.length + 1);
  check(create(a), a.length * 2);
  check(create(a), 1000000000);
}
