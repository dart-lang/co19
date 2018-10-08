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
 * @description Checks that it is an error if the provided range is not valid.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Uint32List(1000);
  Expect.throws(() {
    l.fillRange(-100, -10, 1);
  });

  Expect.throws(() {
    l.fillRange(-1, 2, 1);
  });

  Expect.throws(() {
    l.fillRange(1000, 0, 1);
  });

  Expect.throws(() {
    l.fillRange(0, 1001, 1);
  });

  Expect.throws(() {
    l.fillRange(999, 1001, 1);
  });
}
