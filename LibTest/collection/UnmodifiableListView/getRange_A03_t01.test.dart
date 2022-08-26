// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Iterable<E> getRange(int start, int end)
/// An error occurs if the [start] and [end] are not valid ranges at the time of
/// the call to this method.
/// @description Checks that an error is thrown if the [start] and [end] are not
/// valid ranges.
/// @author iarkh@unipro.ru

import "dart:collection";
import "../../../Utils/expect.dart";

void check(List src, int start, int end) {
  UnmodifiableListView a = new UnmodifiableListView(src);
  Expect.throws(() { a.getRange(start, start + end); }, (e) => e is RangeError);
}

main() {
  check([], 0, 1);
  check(new List.filled(10, null), 1, 10);
  check(new List.filled(1099, null), 0, 1100);
  check(new List.filled(10789, null), 10000, 10000);
}
