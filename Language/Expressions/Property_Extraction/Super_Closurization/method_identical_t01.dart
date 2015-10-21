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
 * @description Check that if o1 == o2 then o1#m == o2#m, o1.m == o2.m,
 * o1#m == o2.m and o1.m == o2#m
 *
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
  int m() => 1;
}

class C extends A {
  void test() {
    Expect.isTrue(super#m == super#m);
    Expect.isTrue(super.m == super.m);
    Expect.isTrue(super#m == super.m);
    Expect.isTrue(super.m == super#m);
  }
}
main() {
  C o = new C();
  o.test();
}
