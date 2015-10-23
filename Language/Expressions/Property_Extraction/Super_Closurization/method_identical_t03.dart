/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Except that iff two closurizations were created by code declared
 * in the same class with identical bindings of this then super1#m == super2#m,
 * super1.m == super2.m, super1#m == super2.m and super1.m == super2#m.
 *
 * @description Check that if two closurizations were created by code declared
 * in the same class with identical bindings of this then super1#m == super2#m,
 * super1.m == super2.m, super1#m == super2.m and super1.m == super2#m.
 * 
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
  int m() => 1;
}

class C extends A {
  getClosurization1() {
    return super.m;
  }
  getClosurization2() {
    return super.m;
  }
  getTearOff1() {
    return super#m;
  }
  getTearOff2() {
    return super#m;
  }
}

main() {
  C o = new C();

  Expect.isTrue(o.getTearOff1() == o.getTearOff2());
  Expect.isTrue(o.getClosurization1() == o.getClosurization2());
  Expect.isTrue(o.getTearOff1() == o.getClosurization2());
  Expect.isTrue(o.getClosurization1() == o.getTearOff2());
}
