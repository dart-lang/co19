/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the square root of a double value.
 * @description Checks negative values.
 * @author msyabro
 * @reviewer pagolubev
 */

#import("dart:math", prefix: "Math");

main() {
  Expect.isTrue(Math.sqrt(-1).isNaN());
  Expect.isTrue(Math.sqrt(-10).isNaN());
  Expect.isTrue(Math.sqrt(-1e-52).isNaN());
  Expect.isTrue(Math.sqrt(-4.9406564584124654e-324).isNaN());
}
