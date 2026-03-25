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
/// @description Checks searching of custom objects.
/// @author varlax

library lastIndexOf_A05_t01;

import "../../../Utils/expect.dart";

checkList(List list, elem, int expected) {
  Expect.equals(expected, list.lastIndexOf(elem));
}

class Eq{
  bool operator ==(other) => other is Eq;
}

test(List<E> create<E>([int length, E fill])) {
  List<Object?> a = create<Object?>(10, -1);
  checkList(a, -1, 9);
  
  var o = new Object();
  a[4] = o;
  checkList(a, o, 4);

  a[8] = o;
  checkList(a, o, 8);

  Eq e = new Eq();
  a[3] = e;
  checkList(a,new Eq(),3);

  a[7] = new Eq();
  checkList(a,new Eq(),7);
}
