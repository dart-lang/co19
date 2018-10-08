/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool operator ==(Object other)
 * ...
 * If one operand is a double and the other is an int, they are equal if the
 * double has an integer value (finite with no fractional part) and
 * identical(doubleValue.toInt(), intValue) is true.
 * ...
 * @description Check that integer values are equal if they have the same value
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(0 == 0.0);
  Expect.isTrue(2 == 2.0);
  Expect.isTrue(2147483648 == 2147483648.0);
  Expect.isTrue(-2147483647 == -2147483647.0);
  Expect.isTrue(4294967296 == 4294967296.0);
  Expect.isTrue(-4294967295 == -4294967295.0);
  Expect.isTrue(1844674407370955161 == 1844674407370955161.0);

  int x = 1;
  double y = 1.0;
  Expect.isTrue(x == y);
}
