// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void setAll(int index, Iterable<E> iterable)
/// ...
/// If iterable is based on this list, its values may change /during/ the setAll
/// operation.
/// @description Checks that the values of iterable may change, if iterable is
/// based on this list.
/// @author ngl@unipro.ru
/// @issue 43227


import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

equal(o1, o2) => o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;

void listEquals(List<Int32x4> expected, Int32x4List l) {
  Expect.equals(expected.length, l.length);
  for (int i = 0; i < l.length; ++i) {
    Expect.isTrue(equal(expected[i], l[i]));
  }
}

main() {
  var list = [i32x4(0), i32x4(1), i32x4(2), i32x4(3), i32x4(4), i32x4(5)];
  var l = new Int32x4List.fromList(list);
  var buffer = l.buffer;
  var view = new Int32x4List.view(buffer, Int32x4List.bytesPerElement * 2, 3);

  listEquals([i32x4(2), i32x4(3), i32x4(4)], view);
  l.setAll(1, view);
  listEquals([i32x4(0), i32x4(2), i32x4(3), i32x4(4), i32x4(4), i32x4(5)], l);

  listEquals([i32x4(3), i32x4(4), i32x4(4)], view);
  l.setAll(3, view);
  listEquals([i32x4(0), i32x4(2), i32x4(3), i32x4(3), i32x4(4), i32x4(4)], l);

  listEquals([i32x4(3), i32x4(3), i32x4(4)], view);
  l.setAll(0, view);
  listEquals([i32x4(3), i32x4(3), i32x4(4), i32x4(3), i32x4(4), i32x4(4)], l);

  listEquals([i32x4(4), i32x4(3), i32x4(4)], view);
}
