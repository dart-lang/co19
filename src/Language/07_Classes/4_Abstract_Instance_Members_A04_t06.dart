/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Unless explicitly stated otherwise, all ordinary rules that apply to methods
 * apply to abstract methods.
 * 7.1: It is a static-warning if an instance method m1 overrides an instance
 * member m2 and m1 does not declare all the named parameters declared by m2.
 * @description Checks that a static warning is produced when the overriding non-abstract
 * instance method has almost the same set of named parameters as the abstract method being overriden, 
 * except for one that has a different name.
 * @static-warning
 * @author rodionov
 * @reviewer iefremov
 * @reviewer kaigorodov
 */
import "../../Utils/expect.dart";

abstract class A {
  f({var x, var y, var z});
}

class C extends A {
  f({var x, var yy, var z}) {} /// static warning
}

main() {
  C c=new C();
  A a=c;

  Expect.throws(() => a.f(x: 1, y: 2, z: 3)); /// static warning

  c.f(x: 1, yy: 2, z: 3);
}
