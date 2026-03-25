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
/// @description Checks that [start] can be out of bounds
/// @author iefremov
/// @author varlax

library lastIndexOf_A03_t01;

import "../../../Utils/expect.dart";

checkList(List list, elem, int idx, int expected) {
  Expect.equals(expected, list.lastIndexOf(elem, idx));
}

check(List a) {
  checkList(a, 42, -1, -1);
  checkList(a, 777, -1, -1);
  checkList(a, null, -1, -1);
  checkList(a, 0, -1, -1);

  checkList(a, 42, 7, 3);
  checkList(a, 777, 7, -1);
  checkList(a, null, 7, -1);
  checkList(a, 0, 7, 6);

  checkList(a, 42, 6031769, 3);
  checkList(a, 777, 6031769, -1);
  checkList(a, null, 6031769, -1);
  checkList(a, 0, 6031769, 6);

  checkList(a, 42, -6031769, -1);
  checkList(a, 777, -6031769, -1);
  checkList(a, null, -6031769, -1);
  checkList(a, 0, -6031769, -1);
}

test(List<E> create<E>([int length, E fill])) {
  List a = create();
  a.addAll(const [42, 0, -1, 42, -1, 6031769, 0]);
  check(a);

  List b = create(a.length, 0);
  b.setRange(0, a.length, a);
  check(b);
}
