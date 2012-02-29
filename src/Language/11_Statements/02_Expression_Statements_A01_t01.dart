/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression statement consists of an expression.
 * expressionStatement:
 * expression? ';' |
 * ; 
 * Execution of an expression statement e; proceeds by evaluating e.
 * @description Checks that execution of an expression statement e;
 * proceeds by evaluating e.
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

foo(x, y, z) { return x + y - z; }

var x;

bar() {
  x = 1;
}

bar2() {
  x = 2;
}

main() {
  var e = 1 + 6 / 3 * 12;
  Expect.equals(25, e);

  e = true || false;
  Expect.equals(true, e);

  e = "A" + "B";
  Expect.equals("AB", e);

  e = foo(0, 1, 2);
  Expect.equals(-1, e);
  
  bar();
  Expect.equals(1, x);
  
  false ? bar() : bar2();
  Expect.equals(2, x);
  
  true || false;
}

