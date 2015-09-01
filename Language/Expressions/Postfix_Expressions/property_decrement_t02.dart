/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A postfix expression of the form C.v-- is equivalent to 
 * (){var r = C.v; C.v = r - 1; return r}().
 * @description Checks that evaluation of an expression of the form C.v--
 * is equivalent to (){var r = C.v; C.v = r - 1; return r;}() in implementation
 * (basically, that postfix -- works via operator- in the described manner).
 * @author rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

bool opInvoked = false;

class A {
  final String value;
  
  A(this.value);
  
  operator -(var other) {
    opInvoked = true;
    return new A("${value}-${other}");
  }
}

class C {
  static A v;
}

main() {
  C.v = new A("foo");
  Expect.isFalse(opInvoked);
  
  Expect.equals("foo", (C.v--).value);
  Expect.isTrue(opInvoked);
  Expect.equals("foo-1", C.v.value);
}
