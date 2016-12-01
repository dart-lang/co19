/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Duration operator unary-()
 * Returns a new Duration representing this Duration negated.
 * The returned Duration has the same length as this one, but will have the
 * opposite sign of this one.
 * @description Checks that this operator returns a new Duration representing
 * this Duration negated.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Duration d1 = new Duration(days: 1, microseconds: 1);
  Duration d2 = -d1;

  Expect.isTrue(d2.isNegative);
  Expect.equals(d1.inMicroseconds, d2.inMicroseconds.abs());

  Duration d3 = new Duration(days: -1, microseconds: 1);
  Duration d4 = -d3;

  Expect.isFalse(d4.isNegative);
  Expect.equals(d3.inMicroseconds.abs(), d4.inMicroseconds);
}
