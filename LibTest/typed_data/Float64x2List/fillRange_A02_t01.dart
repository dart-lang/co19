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
 * The range starts at start and has length end - start. An empty range
 * (with end == start) is valid.
 * @description Checks that is an error if a range, given by start and end, is
 * not a valid range pointed into [this].
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

main() {
  var l = new Float64x2List(100);
  Expect.throws(() {
    l.fillRange(-20, -10, f64x2(1.0));
  });

  Expect.throws(() {
    l.fillRange(120, 121, f64x2(1.0));
  });

  Expect.throws(() {
    l.fillRange(20, -10, f64x2(1.0));
  });

  Expect.throws(() {
    l.fillRange(-20, -40, f64x2(1.0));
  });

  Expect.throws(() {
    l.fillRange(20, 10, f64x2(1.0));
  });

  Expect.throws(() {
    l.fillRange(20, 110, f64x2(1.0));
  });
}
