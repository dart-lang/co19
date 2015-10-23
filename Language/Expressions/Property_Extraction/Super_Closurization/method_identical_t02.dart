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
 * @description Check that if super1 != super2 then super1#m != super2#m,
 * super1.m != super2.m, super1#m != super2.m and super1.m != super2#m
 * @issue 24661
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
  int m() => 1;
}

class B extends A {
  getClosurization() => super.m;
  getTearOff() => super#m;
}

class C extends A {
  void test() {
    Expect.isTrue(super#m != getTearOff());
    Expect.isTrue(super.m != getClosurization());
    Expect.isTrue(super#m != getClosurization());
    Expect.isTrue(super.m != getTearOff());
  }
}

main() {
  C o = new C();
  o.test();
}
