/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
 /**
 * @assertion String toStringAsPrecision(int precision)
 * @description Checks that for positive and negative infinity the method
 * returns 'Infinity' and '-Infinity' respectively regardless of the
 * [precision] value.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  for(int i = 1; i < 22; i++) {
    Expect.equals('Infinity', double.infinity.toStringAsPrecision(i));
    Expect.equals('-Infinity', double.negativeInfinity.toStringAsPrecision(i));
  }
}
