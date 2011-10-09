/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A variable or parameter assignment is of the form identifier = rhs.
 * Where:
 * identifier is a simple identifier.
 * rhs is expression.
 * @description Check that a variable or parameter assignment is a valid expression
 * @author msyabro
 * @reviewer pagolubev
 */


void foo(var x) {
  x = 1;
  x = 5 + 2 / 3;
}

void main() {
  var x;
  x = 1;
  x = 5 + 2 / 3;

  foo(0);
}
