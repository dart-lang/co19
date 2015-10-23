/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The closurization of setter f with respect to superclass S is 
 * defined to be equivalent to (a) {return super.m = a;} if f is named m=, 
 * except that iff two closurizations were created by code declared in the same
 * class with identical bindings of this then super1#m= == super2#m=.
 * @issue 24661
 * @description Check that if super1 != super2 then super1#m= != super2#m=.
 * Test implicit setter
 *
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
  int m;
}

class B extends A {
  getClosurization() {
    return super#m=;
  }
}

class C extends B {
  void test() {
    Expect.isTrue(super#m= != getClosurization());    
  }
}

main() {
  C o = new C();
  o.test();
}
