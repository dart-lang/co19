/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function expression invocation ef(a1, ... , an; xn+1 : an+1, ... , xn+k : an+k)
 * is equivalent to the ordinary method invocation ef.call(a1, ... , an; xn+1 : an+1, ... , xn+k : an+k).
 * @description Checks that a function expression invocation ef(...) is indeed equivalent to the ordinary
 * method invocation ef.call(...) and that the result in either case is the same as expected whether ef is
 * a function literal expression or some other kind of expression. 
 * @author msyabro
 * @reviewer rodionov
 * @issue 1604
 */

f(p1, [p2]) {
  return "$p1$p2";
}

main() {
  var foo = f;
  
  Expect.equals("3", ((p1) => "$p1")(3));
  Expect.equals("3", ((p1) => "$p1").call(3));

  Expect.equals("1null", foo(1));
  Expect.equals("1null", foo.call(1));

  Expect.equals(5, (p1, p2) {Expect.equals(0, p1);Expect.equals(5, p2);return p1 + p2;}(0, 5));
  Expect.equals(5, (p1, p2) {Expect.equals(0, p1);Expect.equals(5, p2);return p1 + p2;}.call(0, 5));
}
