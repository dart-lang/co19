/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An unqualified compound assignment expression is of the form identifier OP= rhs
 * Where:
 * OP is one of the operators |, ^, &, <<, >>, >>>, +, -, *, /, %, or ~/.
 * identifier is a simple identifier.
 * rhs is expression.
 * @description Check that unqualified compound assignment expression is a valid expression
 * @author msyabro
 * @reviewer pagolubev
 */


main() {
  var i = 1;
  i |= 1;
  i ^= 1;
  i &= 1;
  i <<= 2;
  i >>= 1;
  i += 1;
  i -= 1;
  i *= 1;
  i /= 1;
  i %= 1;
  i ~/= 1;
}
