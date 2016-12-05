/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double operator *(num other)
 * @description Checks that if the magnitude is too small to represent, the
 * result is then a zero.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(0.0, -2.2250738585072014e-308 * 1e-100);
  Expect.equals(0.0, -4.9406564584124654e-324 * 0.1);
  Expect.equals(0.0, 2.2250738585072014e-308 * 1e-100);
  Expect.equals(0.0, 4.9406564584124654e-324 * 0.1);
  Expect.equals(0.0, 1e-200 * 1e-200);
  Expect.equals(0.0, 1e-200 * -1e-200);
}

