/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E elementAt(int index)
 * Returns the indexth element.
 * @description Checks that the indexth element is returned.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

main() {
  var list = [
    i32x4(0), i32x4(1), i32x4(2), i32x4(3), i32x4(4), i32x4(5), i32x4(6),
    i32x4(7),i32x4(8), i32x4(9)
  ];
  var l = new Int32x4List.fromList(list);
  for (int i = 0; i < l.length; ++i) {
    Expect.equals(i, l.elementAt(i).x);
    Expect.equals(i, l.elementAt(i).y);
    Expect.equals(i, l.elementAt(i).z);
    Expect.equals(i, l.elementAt(i).w);
  }
}
