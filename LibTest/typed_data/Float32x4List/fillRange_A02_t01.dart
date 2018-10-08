/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void fillRange(int start, int end, [E fillValue])
 * ...
 * The provide range, given by start and end, must be valid. A range from start
 * to end is valid if 0 <= start <= end <= len, where len is this list's length.
 * The range starts at start and has length end - start. An empty range (with
 * end == start) is valid.
 * It is an error if start.. end is not a valid range pointing into the [this].
 * @description Checks that it is an error if range, given by start and end, is
 * not a valid range pointing into [this].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Float32x4List(1000);
  Expect.throws(() {
    l.fillRange(-100, -10, new Float32x4.zero());
  });

  Expect.throws(() {
    l.fillRange(-1, 2, new Float32x4.zero());
  });

  Expect.throws(() {
    l.fillRange(1000, 0, new Float32x4.zero());
  });

  Expect.throws(() {
    l.fillRange(0, 1001, new Float32x4.zero());
  });

  Expect.throws(() {
    l.fillRange(999, 1001, new Float32x4.zero());
  });
}
