/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment of the form e1.v = e2 proceeds as
 * follows:
 * The expression e1 is evaluated to an object o1. Then, the expression e2 is
 * evaluated to an object o2.
 * ...
 * In checked mode, it is a dynamic type error if o2 is not null and the
 * interface of the class of o2 is not a subtype of the actual type of e1.v
 * @description Checks that it is a dynamic type error if o2 is not null and the
 * interface of the class of o2 is not a subtype of the actual type of e1.v.
 * Test the case when e1 is a constant type literal
 * @author msyabro
 */
import '../../../Utils/dynamic_check.dart';

f(x) {return x;}

class A {}
class B extends A {}

class C {
  static int v;
  static B b;
}

main() {
  checkTypeError( () {
    C.v = f(true); //to avoid static warning
  });
  checkTypeError( () {
    C.v = f(""); //to avoid static warning
  });
  checkTypeError( () {
    C.v = f(0.2); //to avoid static warning
  });
  checkTypeError( () {
    C.b = f(new A()); //to avoid static warning
  });
}
