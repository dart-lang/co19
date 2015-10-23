/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The closurization of getter f with respect to superclass S is 
 * defined to be equivalent to ()f {return super.m;} if f is named m, except 
 * that iff two closurizations were created by code declared in the same class
 * with identical bindings of this then super1#m == super2#m
 *
 * @description Check that closurization of getter is equivalent to
 * (){return super.m;}. Test the case when getter is defined in a superclass
 * of the superclass
 *
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
  int get m => 1;
}

class B extends A {
}

class C extends B {
  void test() {
    var f1 = super#m;
    var f2 = () {return super.m;};

    Expect.equals(f1(), f2());    
  }
}

main() {
  C o = new C();
  o.test();
}
