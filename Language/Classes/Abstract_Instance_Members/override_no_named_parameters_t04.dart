/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Unless explicitly stated otherwise, all ordinary rules that apply
 * to methods apply to abstract methods.
 * It is a compile error if an instance method m1 overrides an instance member
 * m2 and m1 does not declare all the named parameters declared by m2.
 * @description Checks that no compile error is produced when the overriding
 * abstract method has the same set of named parameters as the non-abstract
 * instance method being overriden, but in a different order.
 * @static-clean
 * @author rodionov
 */
import "../../../Utils/expect.dart";

class A {
  f({var x, var y}) { return x+y; }
}

abstract class C extends A {
  f({var y, var x});
}

class D extends C {
  f({var x, var y}) { return x-y; }
}

main() {
  A a = new A();
  Expect.equals(3, a.f(x:2, y:1));
  a = new D();
  Expect.equals(1, a.f(x:2, y:1));
}
