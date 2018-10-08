/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> getRange(int start, int end)
 * ...
 * A range from start to end is valid if 0 <= start <= end <= len, where len is
 * this list's length. The range starts at start and has length end - start. An
 * empty range (with end == start) is valid.
 * @description Checks that an error is thrown if end is before start.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

main() {
  var l = new Float32x4List.fromList(
      [pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0)]);

  Expect.throws(() {
    l.getRange(1, 0);
  });
}
