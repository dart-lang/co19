/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression is a fragment of Dart code that can be evaluated at run time
 *  to yield a value, which is always an object.
 * @description Checks that value enclosed in the parentheses is a valid expression
 * @author hlodvig
 * @reviewer iefremov
 * @needsreview TODO: find a proper place for this test and extend it to cover all expressions.
 */

class A{
  void checkThis(){
    Expect.equals(this, (this));
  } 
}

main() {
  Expect.equals(1, (1));
  Expect.equals(1, ( 1 ));
  Expect.equals("a", ("a"));
  Expect.equals(true, (true));
  Expect.equals(false, (false));
  A a = new A();
  Expect.equals(a, (a));
}
