/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void fillRange(int start, int end, [E fillValue])
 * ...
 * The provide range, given by start and end, must be valid. A range from start
 * to end is valid if 0 <= start <= end <= len, where len is this list's length.
 * The range starts at start and has length end - start.
 * @description Checks that it is an error if the range isn't valid.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

main() {
  var l = new Int32x4List(10);

  Expect.throws(() {
    l.fillRange(-1, 2, i32x4(1));
  });

  Expect.throws(() {
    l.fillRange(4, 2, i32x4(1));
  });

  Expect.throws(() {
    l.fillRange(11, 12, i32x4(1));
  });

  Expect.throws(() {
    l.fillRange(4, -3, i32x4(1));
  });

  Expect.throws(() {
    l.fillRange(4, 11, i32x4(1));
  });
}
