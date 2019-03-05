/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let S be a class, M be a mixin with required superinterfaces
 * T1, . . . , Tn, combined superinterface MS, implemented interfaces
 * I1, . . . , Ik and members as mixin member declarations, and let N be a name. 
 * It is a compile-time error to apply  M to S if S does not implement, directly
 * or indirectly, all of T1, . . . , Tn.
 * @description Checks that it is no compile error to derive a mixin from a
 * class which has a superclass other than Object
 * @issue 26409
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

class A {
  int get a => 1;
}

class B extends A {
  int get b => 2;
}

class M extends B {
  int get c => 3;
}

class S extends A {
  int get a => -1;
}

class C extends S with M {
  int get b => -2;
}

main() {
  C c = new C();
  Expect.equals(-1, c.a);
  Expect.equals(-2, c.b);
}
