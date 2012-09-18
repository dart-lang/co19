/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the natural logarithm (base e) of a double value.
 * @description Checks values outside of domain of logarithm.
 * @author msyabro
 * @reviewer pagolubev
 */

#import("dart:math", prefix: "Math");

main() {
  Expect.equals(double.NEGATIVE_INFINITY, Math.log(0.0));
  Expect.equals(double.NEGATIVE_INFINITY, Math.log(-0.0));
  Expect.isTrue(Math.log(-1).isNaN());
  Expect.isTrue(Math.log(-0.5).isNaN());
}
