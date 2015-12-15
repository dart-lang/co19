/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  A function expression invocation i has the form
 * ef(a1, ..., an, xn+1: an+1, ..., xn+k: an+k), where ef is an expression.
 * . . .
 * If ef is a property extraction expression, then i is not a function
 * expression invocation and is instead recognized as an ordinary method
 * invocation.
 * @description Checks that if ef is a property access expression,
 * then i is treated as an ordinary method invocation.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../../Utils/expect.dart';

class C {
  method1() {return 1;}
  method2(p1, p2) {return p1 + p2;}
}

main() {
  var o = new C();
  Expect.equals(1, o.method1());
  Expect.equals(3, o.method2(1, 2));
}
