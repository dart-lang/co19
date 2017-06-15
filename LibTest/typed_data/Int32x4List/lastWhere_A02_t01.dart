/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E lastWhere(bool test(E element), {E orElse()})
 * ...
 * An iterable that can access its elements directly may check its elements in
 * any order (for example a list starts by checking the last element and then
 * moves towards the start of the list). The default implementation iterates
 * elements in iteration order, checks test(element) for each, and finally
 * returns that last one that matched.
 * @description Checks that function test is invoked every time when an iterable
 * is iterated through elements to find last element that satisfies the given
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
  l.lastWhere((e) {counter++; return e.x > 2;});
  Expect.equals(1, counter);

  l.lastWhere((e) {counter++; return e.y == 1;});
  Expect.equals(4, counter);

  l.lastWhere((e) {counter++; return e.z < 3;});
  Expect.equals(7, counter);

  l.lastWhere((e) {counter++; return e.w > 3;});
  Expect.equals(8, counter);
}
