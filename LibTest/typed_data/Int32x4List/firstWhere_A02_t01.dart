/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E firstWhere(bool test(E element), {E orElse()})
 * ...
 * Iterates through elements and returns the first to satisfy test.
 * @description Checks that function test is invoked every time when firstWhere
 * iterates through elements to find first element that satisfies the given
 * predicate test.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

main() {
  var list = [i32x4(0), i32x4(1), i32x4(2), i32x4(1), i32x4(3), i32x4(4)];
  var l = new Int32x4List.fromList(list);
  var counter = 0;
  l.firstWhere((e) {counter++; return e.x > 2;});
  Expect.equals(5, counter);

  l.firstWhere((e) {counter++; return e.y == 1;});
  Expect.equals(7, counter);

  l.firstWhere((e) {counter++; return e.z < 3;});
  Expect.equals(8, counter);

  l.firstWhere((e) {counter++; return e.w > 3;});
  Expect.equals(14, counter);
}
