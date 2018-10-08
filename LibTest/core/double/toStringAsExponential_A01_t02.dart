import "../../../Utils/expect.dart";
/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
 /**
 * @assertion String toStringAsExponential(int fractionDigits)
 * @description Checks that for positive and negative infinity the method
 * returns 'Infinity' and '-Infinity' respectively regardless of the
 * [fractionDigits] value.
 * @author msyabro
 */

main() {
  for(int i = 0; i < 10; i++) {
    Expect.equals('Infinity', double.infinity.toStringAsExponential(i));
    Expect.equals('-Infinity', double.negativeInfinity.toStringAsExponential(i));
  }
}
