/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Map<int, E> asMap()
 * Returns an unmodifiable Map view of this.
 * The map uses the indices of this list as keys and the corresponding objects
 * as values.
 * @description Checks that returned map is unmodifiable.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4p(n) => new Int32x4(n, n + 1, n + 2, n + 3);

void check(list) {
  var l = new Int32x4List.fromList(list);
  dynamic m = l.asMap();
  Expect.throws(() {
    m[0] = i32x4p(100);
  });
}

main() {
  check([i32x4p(1)]);
  check([i32x4p(10), i32x4p(11), i32x4p(12), i32x4p(13)]);
  check([
    i32x4p(0), i32x4p(1), i32x4p(2), i32x4p(3), i32x4p(4), i32x4p(5), i32x4p(6),
    i32x4p(7),i32x4p(8), i32x4p(9)
  ]);
}
