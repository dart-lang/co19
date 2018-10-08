/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double operator -(num other)
 * @description Checks that if 'this' is positive infinity and 'other' is
 * negative infinity the result is positive infinity. If 'this' is negative
 * infinity and 'other' is positive infinity the result is negative infinity.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

main() {  
  Expect.equals(double.infinity, double.infinity - double.negativeInfinity);
  Expect.equals(double.negativeInfinity,
      double.negativeInfinity - double.infinity);
}
