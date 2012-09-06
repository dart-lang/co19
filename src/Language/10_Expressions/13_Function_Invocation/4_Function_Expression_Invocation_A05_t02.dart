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
 * @author rodionov
 * @needsreview Issue 1286, Issue 1287, Function.call is not implemented yet, it seems
 */

class C {
  call(x, [y = "foo"]) {
    return "call($x, $y)";
  }
}

main() {
  C c = new C();
  try {
    c();
  } on NoSuchMethodException catch(ok) {}
  
  Expect.equals("call(1, foo)", c(1));
  Expect.equals("call(2, bar)", c(2, "bar"));

  try {
    c(1, 2, 3);
  } on NoSuchMethodException catch(ok) {}
}
