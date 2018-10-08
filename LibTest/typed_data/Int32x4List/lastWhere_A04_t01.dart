/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E lastWhere(bool test(E element), {E orElse()})
 * ...
 * If orElse is omitted, it defaults to throwing a StateError.
 * @description Checks that if orElse is omitted, a StateError is thrown.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

main() {
  var list = [i32x4(1), i32x4(2), i32x4(3), i32x4(4), i32x4(5), i32x4(6)];
  var l = new Int32x4List.fromList(list);
  try {
    l.lastWhere((e) => e.x > 6);
    Expect.fail("StateError is expected");
  } on StateError {}

  try {
    l.lastWhere((e) => e.y == 10);
    Expect.fail("StateError is expected");
  } on StateError {}

  try {
    l.lastWhere((e) => e.z < 0);
    Expect.fail("StateError is expected");
  } on StateError {}
}
