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
 *
 * @description Check that if two closurizations were created by code declared 
 * in the same class but different bindings of this then super1#m != super2#m
 * Test implicit setter
 *
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
  int m;
}

class C extends A {
  getClosurization() {
    return super#m=;
  }
}

main() {
  C o1 = new C();
  C o2 = new C();
  Expect.isTrue(o1.getClosurization() != o2.getClosurization());
}
