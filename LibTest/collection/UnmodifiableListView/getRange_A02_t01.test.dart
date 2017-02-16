/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> getRange(int start, int end)
 * An error occurs if [end] is before [start].
 * @description Checks that an error is thrown if end is before start.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

check(List src, int start, int end) {
  UnmodifiableListView a = new UnmodifiableListView(src);
  Expect.throws(() { a.getRange(start, end); }, (e) => e is ArgumentError);
}

main() {
  check([2], -1, 0);
  check([2], 1, 0);
  check([1, 2, 3, 4, 5], 5, 3);
}
