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
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";


final double positive_infinity = 1 / 0;
final double negative_infinity = -1 / 0;

main() {  
  Expect.equals(positive_infinity, positive_infinity - negative_infinity);
  Expect.equals(negative_infinity, negative_infinity - positive_infinity);
}
