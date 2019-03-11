/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let S be a class, M be a mixin with required superinterfaces
 * T1, . . . , Tn, combined superinterface MS, implemented interfaces
 * I1, . . . , Ik and members as mixin member declarations, and let N be a name.
 * ...
 * The mixin application of M to S with name N introduces a new class, C,
 * with name N, superclass S, implemented interface I1, . . . , Ik and members
 * as instance members.
 * @description Checks that it is no compile error to derive a mixin from a
 * class which has a superclass other than Object, even if mixin has all of its
 * explicitly defined getters
 * @issue 26409
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

class S {
  int get g1 => 1;
}

class M extends S {
  int get g2 => 2;
}

class A extends S {
  int get g3 => 3;
}

class C extends A with M {
}

main() {
  C c = new C();
  Expect.equals(c.g1, 1);
  Expect.equals(c.g2, 2);
  Expect.equals(c.g3, 3);
}
