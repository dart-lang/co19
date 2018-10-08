/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> getRange(int start, int end)
 * An error occurs if the [start] and [end] are not valid ranges at the time of
 * the call to this method.
 * @description Checks that an error is thrown if the [start] and [end] are not
 * valid ranges.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

void check(List src, int start, int end) {
  UnmodifiableListView a = new UnmodifiableListView(src);
  Expect.throws(() { a.getRange(start, start + end); }, (e) => e is RangeError);
}

main() {
  check([], 0, 1);
  check(new List(10), 1, 10);
  check(new List(1099), 0, 1100);
  check(new List(10789), 10000, 10000);
}
