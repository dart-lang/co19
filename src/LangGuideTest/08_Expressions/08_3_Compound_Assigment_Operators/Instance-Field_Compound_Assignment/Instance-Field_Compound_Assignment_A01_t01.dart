/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An instance-field compound assignment expression is of the form lhs.identifier OP= rhs
 * Where:
 * OP is one of the operators |, ^, &, <<, >>, >>>, +, -, *, /, %, or ~/.
 * identifier is a simple identifier.
 * lhs and rhs are expressions.
 * @description Check if instance-field compound assignment expression is a valid expression
 * @author msyabro
 * @reviewer pagolubev
 */

class A {
  var i;
  A(): i = 1 {}
}


void main() {
  A a = new A();
  a.i |= 1;
  a.i ^= 1;
  a.i &= 1;
  a.i <<= 2;
  a.i >>= 1;
  a.i >>>= 1;
  a.i += 1;
  a.i -= 1;
  a.i *= 1;
  a.i /= 1;
  a.i %= 1;
  a.i ~/= 1;
}
