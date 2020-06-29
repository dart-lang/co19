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
 * @author kaigorodov, sgrekhov@unipro.ru
 */
import "dart:math";

main() {
  new Point(0, 0) * null; //# 01: compile-time error
  new Point(null, 0) * 1; //# 02: compile-time error
  new Point(0, null) * 1; //# 03: compile-time error
}
