/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int sign
 * Returns the sign of this integer.
 * Returns 0 for zero, -1 for values less than zero and +1 for values greater
 * than zero.
 * @description Checks that this method returns true for integers
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(0, 0.sign);
  Expect.equals(1, 1.sign);
  Expect.equals(1, 123456789.sign);
  Expect.equals(1, 800000000000000.sign);
  Expect.equals(-1, -1.sign);
  Expect.equals(-1, -123456789.sign);
  Expect.equals(-1, (-8000000000000000000).sign);
}
