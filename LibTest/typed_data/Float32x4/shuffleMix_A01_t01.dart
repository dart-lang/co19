/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float32x4 shuffleMix(Float32x4 other, int mask)
 * Shuffle the lane values in this and other.
 * The returned Float32x4 will have XY lanes from this and ZW lanes from other.
 * Uses the same mask as shuffle.
 * @description Checks that the lane values are shuffled correctly.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var fv = new Float32x4(.0, 1.0, 2.0, 3.0);
  var fv2 = new Float32x4(10.0, 11.0, 12.0, 13.0);
  for (int x = 0; x < 4; ++x) {
    for (int y = 0; y < 4; ++y) {
      for (int z = 0; z < 4; ++z) {
        for (int w = 0; w < 4; ++w) {
          int mask = w << 6 | z << 4 | y << 2 | x;
          var res = fv.shuffleMix(fv2, mask);
          Expect.equals(x, res.x);
          Expect.equals(y, res.y);
          Expect.equals(z + 10, res.z);
          Expect.equals(w + 10, res.w);
        }
      }
    }
  }
}
