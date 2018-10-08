/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double operator *(num other)
 * @description Checks that if one of the operands is a zero and the other is 
 * an infinity the result is NaN.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

checkNaN(d) {
  var msg = 'expected: NaN, actual: $d';
  Expect.isTrue(d.isNaN, msg);
}

main() {
  checkNaN(double.infinity * .0);
  checkNaN(.0 * double.infinity);

  checkNaN(double.infinity * (-.0));
  checkNaN((-.0) * double.infinity);

  checkNaN(double.negativeInfinity * .0);
  checkNaN(.0 * double.negativeInfinity);

  checkNaN(double.negativeInfinity * (-.0));
  checkNaN((-.0) * double.negativeInfinity);
}
