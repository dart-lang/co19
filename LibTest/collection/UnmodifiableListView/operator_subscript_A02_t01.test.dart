/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E operator [](int index)
 * @description Checks that [RangeError] is thrown if [index] is out of bounds.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

void check(List a0, int idx) {
  UnmodifiableListView a = new UnmodifiableListView(a0);
  Expect.throws(() { a[idx]; }, (e) => e is RangeError);
}

main() {
  check([], 0);
  check([], 1);
  check([], -1);
  check([], 6031769);
  check([1], 2);
  check([null, null, null, null], 5);
  check([null, null, null, null], -1);

  List l = new List(123);
  check(l, 124);
  check(l, -1);
}
