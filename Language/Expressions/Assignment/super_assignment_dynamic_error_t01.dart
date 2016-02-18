/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment of the form super.v = e2 proceeds as
 * follows:
 * ...
 * In checked mode, it is a dynamic type error if o is not null and the
 * interface of the class of o is not a subtype of the actual type of S.v.
 * @description Checks that it is a dynamic type error if the interface of
 * the class of o is not a subtype of the actual type of S.v
 * @author sgrekhov@unipro.ru
 */

import '../../../Utils/dynamic_check.dart';

f(x) {return x;}

class A {
  int v;
  C b;
}

class C extends A {
  test() {
    checkTypeError( () {
      super.v = f(true); //to avoid static warning
    });
    checkTypeError( () {
      super.v = f(""); //to avoid static warning
    });
    checkTypeError( () {
      super.v = f(0.2); //to avoid static warning
    });
    checkTypeError( () {
      super.b = f(new A()); //to avoid static warning
    });
  }
}

main() {
  C c = new C();
  c.test();
}
