/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double operator /(num other)
 * @description Checks that if both operands are infinite the result is a NaN.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

checkNaN(d) {
  var msg = 'Expected: NaN, actual: $d';
  Expect.isTrue(d.isNaN, msg);
}

main() {
  checkNaN(double.infinity / double.infinity);
  checkNaN(double.infinity / double.negativeInfinity);
  checkNaN(double.negativeInfinity / double.infinity);
  checkNaN(double.negativeInfinity / double.negativeInfinity);
}
