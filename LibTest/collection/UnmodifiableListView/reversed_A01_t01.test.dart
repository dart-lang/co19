/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Iterable<E> reversed
 * Returns an [Iterable] of the elements of this list in reverse order.
 * @description Checks that the returned [Iterator] iterates all elements of the
 * list in the reversed order.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

void check(List a) {
  List b = new UnmodifiableListView(a);
  Iterator it = b.reversed.iterator;
  int i = a.length - 1;
  while (it.moveNext()) {
    Expect.isTrue(it.current == a[i--]);
  }
  Expect.equals(-1, i);
}

main() {
  check([]);
  check([1, 2, 3, 4, 5]);
  check(["0", "1", "2", "3", "4", "5"]);
  check(const [null, 0, "1", false, const []]);
  List a = new List(365);
  for (var i = 0; i < a.length; i++) {
    a[i] = i;
  }
  check(a);
}
