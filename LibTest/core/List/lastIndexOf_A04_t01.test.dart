// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion abstract int lastIndexOf(E element, [int? start])
/// The last index of element in this list.
///
/// Searches the list backwards from index `start` to `0`.
///
/// The first time an object `o` is encountered so that `o == element`, the
/// index of `o` is returned.
///
/// If `start` is not provided, this method searches from the end of the list.
///
/// Returns `-1` if `element` is not found.
///
/// @description Checks searching w/o `start`.
/// @author varlax

library lastIndexOf_A04_t01;

import "../../../Utils/expect.dart";

checkList(List list, elem, int expected) {
  Expect.equals(expected, list.lastIndexOf(elem));
}

check(List ls) {
  checkList(ls, 42, 3);
  checkList(ls, 777, -1);
  checkList(ls, null, -1);
  checkList(ls, 0, 6);
  checkList(ls, 6031769, 5);
}

test(List<E> create<E>([int length, E fill])) {
  List a = create();
  a.addAll(const [42, 0, -1, 42, -1, 6031769, 0]);
  check(a);

  List b = create(a.length, 0);
  b.setRange(0, a.length, a);
  check(b);
}
