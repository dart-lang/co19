// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let S be a class, M be a mixin with required superinterfaces
/// T1, . . . , Tn, combined superinterface MS, implemented interfaces
/// I1, . . . , Ik and members as mixin member declarations, and let N be a
/// name.
/// ...
/// The mixin application of M to S with name N introduces a new class, C, with
/// name N, superclass S, implemented interface I1, . . . , Ik and members as
/// instance members.
///
/// @description Checks that a mixin application of the form `S with M1,...,Mk;`
/// defines a class `C` with superclass `S with M1,...Mk-1`. So if `Mi` have
/// methods with the same names then `Mk` method overrides the ones from `Mi`
/// @author sgrekhov@unipro.ru

import '../../../Utils/expect.dart';

class S {
  String get m => "S";
}

mixin class M1 {
  String get m => "M1";
}

mixin class M2 {
  String get m => "M2";
}

mixin class M3 {
  String get m => "M3";
}

class C1 = S with M1;
class C2 = S with M1, M2;
class C3 = S with M1, M2, M3;

main() {
  C1 c1 = new C1();
  Expect.equals("M1", c1.m);

  C2 c2 = new C2();
  Expect.equals("M2", c2.m);

  C3 c3 = new C3();
  Expect.equals("M3", c3.m);
}
