/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> sublist(int start, [int end])
 * Returns a new list containing the elements from [start] inclusive to [end]
 * exclusive.
 * @description Checks that the returned list contains all elements of [this]
 * from [start] to [end].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<int> list, int start, int end) {
  var l = new Uint8List.fromList(list);
  var res = l.sublist(start, end);

  for (int i = start; i< end; ++i) {
    Expect.equals(l[i], res[i - start]);
  }
}

main() {
  check([], 0, 0);
  check([1], 0, 1);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 0, 10);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 0, 0);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 0, 1);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 9, 10);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 4, 7);
}
