/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * abstract int floor()
 * If this is not finite (NaN or infinity), throws an UnsupportedError.
 * @description Checks that [:floor():] called on a NaN throws an UnsupportedError.
 * @author kaigorodov
 */
import "dart:math" as Math;
import "../../../Utils/expect.dart";

check(double arg) {
  Expect.throws(() {arg.floor();}, (e) =>e is UnsupportedError);
}

main() {
  double nan = double.nan;
  check(nan);
  check(-nan);
  check(.0/(1-1));
  check(nan*100);
  check(Math.sqrt(-1));
  check(Math.sin(nan));
}
