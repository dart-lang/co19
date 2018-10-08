/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Point<T> operator *(num factor)
 * This function accepts a num as its argument only so that you can scale
 * Point<double> objects by an int factor.
 * Because the star operator always returns the same type of Point that
 * originally called it, passing in a double factor on a Point<int> causes a
 * runtime error in checked mode.
 * @description Checks that passing in a double factor on a Point<int> causes a
 * runtime error in checked mode.
 * Checks that passing in an int factor on a Point<double> does not causes a
 * runtime error.
 * @author kaigorodov
 */

import "dart:math";
import "../../../Utils/dynamic_check.dart";

main() {

  checkTypeError(() {
    return new Point<int>(1, 2) * 1.0;
  });
  new Point<double>(1.0, 2.1) * 1;
}
