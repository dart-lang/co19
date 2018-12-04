/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void forEach(void f(E element))
 * Applies the function f to each element of this collection in iteration order.
 * @description Checks that function f is performed for each element of this
 * list.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

main() {
  var l = new Int32x4List(0);
  var res = i32x4(0);
  l.forEach((e) => res += e);
  Expect.isTrue(equal(i32x4(0), res));

  var list = [i32x4(0), i32x4(1), i32x4(2), i32x4(1), i32x4(3), i32x4(4)];
  l = new Int32x4List.fromList(list);

  l.forEach((e) => res += e);
  Expect.equals(list.length, l.length);
  Expect.isTrue(equal(i32x4(11), res));
}
