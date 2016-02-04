/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment of the form v = e2 proceeds as
 * follows:
 * ...
 * In checked mode, it is a dynamic type error if o is not null and the
 * interface of the class of o is not a subtype of the actual type of v.
 * @description Checks that it is a dynamic type error if the interface of
 * the class of o is not a subtype of the actual type of v
 * @author msyabro
 */

import '../../../Utils/dynamic_check.dart';

f(x) {return x;}

class A {}
class B extends A {}

main() {
  int v;
  B b;

  checkTypeError( () {
    v = f(true); //to avoid static warning
  });
  checkTypeError( () {
    v = f(""); //to avoid static warning
  });
  checkTypeError( () {
    v = f(0.2); //to avoid static warning
  });
  checkTypeError( () {
    b = f(new A()); //to avoid static warning
  });
}
