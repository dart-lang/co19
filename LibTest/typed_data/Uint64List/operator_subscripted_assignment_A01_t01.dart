/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void operator []=(int index, E value)
 * Sets the value at the given index in the list to value.
 * @description Checks that the entry at the given index is set.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<int> list) {
  var l = new Uint64List(list.length);
  for (int i = 0; i < list.length; ++i) {
    l[i] = list.elementAt(i);
    Expect.identical(list.elementAt(i), l.elementAt(i));
  }
}

main() {
  check([1]);
  check([
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20
  ]);
}
