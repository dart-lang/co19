/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
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
 * @description Checks that mixin application of the form S with M; defines a
 * class C with superclass S. So if M and S have getters with the same names
 * then mixin method overrides one from S
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

class S {
  String get m => "S";
}

class M {
  String get m => "M";
}

class C extends S with M {
  test() {
    Expect.equals("M", super.m);
  }
}

main() {
  C c = new C();
  c.test();
}
