/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Point<T> operator *(num factor)
 * Scale this point by factor as if it were a vector.
 * Important Note: This function accepts a num as its argument only so that you
 * can scale Point<double> objects by an int factor.
 * Because the star operator always returns the same type of Point that
 * originally called it, passing in a double factor on a Point<int> causes a
 * runtime error in checked mode.
 * @description Checks that if at least one of coordinates is null, an
 * Exception is thrown.
 * @note undocumented
 * @author kaigorodov
 */

import "dart:math";
import "../../../Utils/expect.dart";

void check(num x1, num y1, num n) {
  Expect.throws(() {
    new Point(x1, y1) * n;
  });
}

main() {
  check(1, -1, null);
  check(1, null, -1);
  check(null, 1, -1);
  check(null, null, 1);
  check(null, 0, null);
  check(1, null, null);
}
