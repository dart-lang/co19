/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float32x4 clamp(Float32x4 lowerLimit, Float32x4 upperLimit)
 * Lane-wise clamp this to be in the range [lowerLimit] - [upperLimit].
 * @description Checks that if [upperLimit] is less than [lowerLimit], the
 * resulted value equals MAX(MIN([this], [upperLimit]), [lowerLimit]).
 * @note undocumented
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(obj, lowerLimit, upperLimit, expected) {
  var res = obj.clamp(lowerLimit, upperLimit);
  Expect.equals(expected.x, res.x);
  Expect.equals(expected.y, res.y);
  Expect.equals(expected.z, res.z);
  Expect.equals(expected.w, res.w);
}

main() {
  check(new Float32x4(.0, .0, .0, .0), new Float32x4(1.0, 1.0, 1.0, 1.0),
      new Float32x4(-1.0, -1.0, -1.0, -1.0), new Float32x4(1.0, 1.0, 1.0, 1.0));

  check(new Float32x4(-5.0, -5.0, -5.0, -5.0),
      new Float32x4(1.0, 1.0, 1.0, 1.0), new Float32x4(-1.0, -1.0, -1.0, -1.0),
      new Float32x4(1.0, 1.0, 1.0, 1.0));

  check(new Float32x4(1.0, 1.0, 1.0, 1.0), new Float32x4(1.0, 1.0, 1.0, 1.0),
      new Float32x4(-1.0, -1.0, -1.0, -1.0), new Float32x4(1.0, 1.0, 1.0, 1.0));

  check(new Float32x4(.0, .0, .0, .0), new Float32x4(1.0, -1.0, -1.0, -1.0),
      new Float32x4(-1.0, 1.0, 1.0, 1.0), new Float32x4(1.0, .0, .0, .0));
}
