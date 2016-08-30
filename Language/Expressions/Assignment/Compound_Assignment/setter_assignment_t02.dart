/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A compound assignment of the form C.v op= e is equivalent
 * to C.v=C.v op e.
 * @description Checks that an expression of the form C.v /= e is equivalent
 * to C.v = C.v / e.
 * @author msyabro
 */
import '../../../../Utils/expect.dart';

class A {
  operator /(val) {
    return val.toString();
  }
}

class C {
  static get v {
    ++getterInvocation;
    return _v;
  }

  static set v(val) {
    ++setterInvocation;
    _v = val;
  }

  static var _v;

  static int setterInvocation;
  static int getterInvocation;
}


main() {
  C._v = new A();
  C.getterInvocation = 0;
  C.setterInvocation = 0;
  Expect.equals("1", C.v /= 1);
  Expect.equals(1, C.getterInvocation);
  Expect.equals(1, C.setterInvocation);
  Expect.equals("1", C._v);

  C._v = new A();
  C.getterInvocation = 0;
  C.setterInvocation = 0;
  Expect.equals("null", C.v /= null);
  Expect.equals(1, C.getterInvocation);
  Expect.equals(1, C.setterInvocation);
  Expect.equals("null", C._v);

  C._v = new A();
  C.getterInvocation = 0;
  C.setterInvocation = 0;
  Expect.equals("true", C.v /= true);
  Expect.equals(1, C.getterInvocation);
  Expect.equals(1, C.setterInvocation);
  Expect.equals("true", C._v);
}
