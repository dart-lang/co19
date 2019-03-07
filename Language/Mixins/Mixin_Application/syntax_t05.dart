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
 * class C with superclass S. So if M and S have methods with the same names
 * then mixin method overrides the one from S. Test class C = S with M syntax
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

class S {
  String get m => "S";
}

class M {
  String get m => "M";
}

class C = S with M;

main() {
  C c = new C();
  Expect.equals("M", c.m);
}
