/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int lastIndexOf(E element, [ int start ])
 * Returns the last index of element in this list.
 * ...
 * Returns -1 if element is not found.
 * @description Checks that -1 is returned for Int32x4List.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

main() {
  var list = [i32x4(0), i32x4(1), i32x4(1), i32x4(2), i32x4(2), i32x4(3)];
  var l = new Int32x4List.fromList(list);

  var res = l.lastIndexOf(i32x4(0));
  Expect.equals(-1, res);

  res = l.lastIndexOf(i32x4(1));
  Expect.equals(-1, res);

  res = l.lastIndexOf(i32x4(2));
  Expect.equals(-1, res);

  res = l.lastIndexOf(i32x4(3));
  Expect.equals(-1, res);

  res = l.lastIndexOf(i32x4(4));
  Expect.equals(-1, res);
}
