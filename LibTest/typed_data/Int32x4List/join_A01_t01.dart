/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String join([String separator = "" ])
 * Converts each element to a String and concatenates the strings.
 * Iterates through elements of this iterable, converts each one to a String by
 * calling Object.toString, and then concatenates the strings, with the
 * separator string interleaved between the elements.
 * @description Checks that the returned String contains all elements of this
 * list separated by separator.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

check(List<Int32x4> list, String separator, String expected) {
  var l = new Int32x4List.fromList(list);
  var res = l.join(separator);
  Expect.equals(expected, res);
}

main() {
  check([], "", "");
  check([], ", ", "");
  check([i32x4(0), i32x4(1), i32x4(2), i32x4(3)], ", ",
      "[00000000, 00000000, 00000000, 00000000], "
      "[00000001, 00000001, 00000001, 00000001], "
      "[00000002, 00000002, 00000002, 00000002], "
      "[00000003, 00000003, 00000003, 00000003]");
}
