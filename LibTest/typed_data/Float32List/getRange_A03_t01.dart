/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> getRange(int start, int end)
 * The provide range, given by start and end, must be valid at the time of the
 * call.
 * A range from start to end is valid if 0 <= start <= end <= len, where len is
 * this list's length. The range starts at start and has length end - start.
 * @description Checks that an error is thrown if start > end.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Float32List.fromList([0.0, 0.0, 0.0, 0.0, 0.0]);

  Expect.throws(() {
    l.getRange(1, 0);
  });
}
