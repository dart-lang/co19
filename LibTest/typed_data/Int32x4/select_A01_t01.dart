/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float32x4 select(Float32x4 trueValue, Float32x4 falseValue)
 * Merge [trueValue] and [falseValue] based on [this]' bit mask:
 * Select bit from [trueValue] when bit in [this] is on.
 * Select bit from [falseValue] when bit in [this] is off.
 * @description Checks that lanes in the returned [Float32x4] are correct.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(x, y, z, w, fxt, fyt, fzt, fwt, fxf, fyf, fzf, fwf, fxe, fye, fze, fwe) {
  var maskVector = new Int32x4(x, y, z, w);
  var floatTrue = new Float32x4(fxt, fyt, fzt, fwt);
  var floatFalse = new Float32x4(fxf, fyf, fzf, fwf);

  var result = maskVector.select(floatTrue, floatFalse);

  Expect.equals(fxe, result.x);
  Expect.equals(fye, result.y);
  Expect.equals(fze, result.z);
  Expect.equals(fwe, result.w);
}

main() {
  check(0, 0, 0, 0,
        1.0, 1.0, 1.0, 1.0,
        2.0, 2.0, 2.0, 2.0,
        2.0, 2.0, 2.0, 2.0);
  check(0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
        1.0, 1.0, 1.0, 1.0,
        2.0, 2.0, 2.0, 2.0,
        1.0, 1.0, 1.0, 1.0);
  check(0x7fffffff, 0x7fffffff, 0x7fffffff, 0x7fffffff,
        1.0, 1.0, 1.0, 1.0,
        -2.0, -2.0, -2.0, -2.0,
        -1.0, -1.0, -1.0, -1.0);
  check(0x01010101, 0xcccccccc, 0x55555555, 0x123ef2ce,
        1.0, 1.0, 1.0, 1.0,
        1.0, 1.0, 1.0, 1.0,
        1.0, 1.0, 1.0, 1.0);
  check(0x12674ca8, 0xd7672fca, 0x00f2ccad, 0xe8e8e8e8,
        1.0, 2.0, 3.0, 4.0,
        -3.0, -10.0, 4.0, 0.5,
        -137438953472.0, 2.0, 3.0, 281474976710656.0);
}
