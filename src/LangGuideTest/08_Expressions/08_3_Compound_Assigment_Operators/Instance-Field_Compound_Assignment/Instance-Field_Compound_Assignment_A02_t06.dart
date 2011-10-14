/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An instance-field compound assignment lhs.identifier OP= rhs is evaluated in a fashion that is equivalent to:
 * (function($0) { return $0.identifier = $0.identifier OP rhs; })(lhs)
 * @description Check that operator >>>= works correctly
 * @author msyabro
 * @reviewer iefremov
 * @needsreview Current spec does not specify the behavior of >>>= on non-integers.
 */

class A {
  var i;
  A(): i = -2 {}
}


main() {
  A a = new A();
  Expect.isTrue( (a.i >>>= 3) == 536870911);
}
