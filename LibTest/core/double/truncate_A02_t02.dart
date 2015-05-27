/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract int truncate()
 * If this is not finite (NaN or infinity), throws an UnsupportedError.
 * @description Checks truncation of infinity.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

int check(double d) {
  int res;
  try {
      res=d.truncate();
      Expect.fail("UnsupportedError expected");
  } on UnsupportedError catch (ok) {
  }
  return res;
}

main() {
  double inf = 1 / 0;
  check(inf);
  check(-inf);
}
