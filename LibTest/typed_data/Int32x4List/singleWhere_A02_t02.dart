/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E singleWhere(bool test(E element))
 * ...
 * Otherwise, if there are no matching elements, or if there is more than one
 * matching element, a StateError is thrown.
 * @description Checks that a StateError is thrown if there is no element that
 * satisfies test.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

main() {
  var list = [
    i32x4(0), i32x4(1), i32x4(2), i32x4(3), i32x4(4), i32x4(5), i32x4(6),
    i32x4(1), i32x4(8), i32x4(9), i32x4(4), i32x4(5)
  ];
  var l = new Int32x4List.fromList(list);
  try {
    l.singleWhere((e) => false);
    Expect.fail("StateError is expected");
  } on StateError {}

  try {
    l.singleWhere((e) => e.x > 9);
    Expect.fail("StateError is expected");
  } on StateError {}

  try {
    l.singleWhere((e) => e.x < 0);
    Expect.fail("StateError is expected");
  } on StateError {}

  l = new Int32x4List.fromList([]);
  try {
    l.singleWhere((e) => true);
    Expect.fail("StateError is expected");
  } on StateError {}
}
