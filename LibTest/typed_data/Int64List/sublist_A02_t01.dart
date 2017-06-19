/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> sublist(int start, [int end])
 * ...
 * If [end] is omitted, the [length] of [this] is used.
 * @description Checks that if [end] is omitted, the [length] of [this] is used.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<int> list, int start) {
  var l = new Int64List.fromList(list);
  var res = l.sublist(start);

  for (int i = start; i < l.length; ++i) {
    Expect.equals(l[i], res[i - start]);
  }
}

main() {
  check([], 0);
  check([1], 0);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 0);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 9);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 4);
}
