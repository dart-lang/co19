// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The return type of a getter, parameter type of a setter or type
/// of a field which overrides/implements only one or more getters is inferred
/// to be the return type of the combined member signature of said getter in the
/// direct superinterfaces.
///
/// @description Checks that the return type of a getter/field or parameter type
/// of a setter is inferred as a combined member signature of said getters in
/// the direct superinterface.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

mixin class A {
  num get m1 => 3.14;
  num get m2 => 3.14;
  num get m3 => 3.14;
}

mixin class B {
  int get m1 => 42;
  int get m2 => 42;
  int get m3 => 42;
}

class C1 extends A implements B {
  get m1 => 0;
  get m2 => 0; // We need to implement a getter as well
  void set m2(v) {
    v.expectStaticType<Exactly<int>>();
  }
  final m3 = 0;
}

class C2 implements A, B {
  get m1 => 0;
  get m2 => 0;
  void set m2(v) {
    v.expectStaticType<Exactly<int>>();
  }
  final m3 = 0;
}

class C3 with A implements B {
  get m1 => 0;
  get m2 => 0;
  void set m2(v) {
    v.expectStaticType<Exactly<int>>();
  }
  final m3 = 0;
}

class C4 with B implements A {
  get m1 => 0;
  void set m2(v) {
    v.expectStaticType<Exactly<int>>();
  }
  final m3 = 0;
}

mixin M implements A, B {
  get m1 => 0;
  get m2 => 0;
  void set m2(v) {
    v.expectStaticType<Exactly<int>>();
  }
  final m3 = 0;
}

mixin class MC implements A, B {
  get m1 => 0;
  get m2 => 0;
  void set m2(v) {
    v.expectStaticType<Exactly<int>>();
  }
  final m3 = 0;
}

enum E1 implements A, B {
  e0;

  get m1 => 0;
  get m2 => 0;
  void set m2(v) {
    v.expectStaticType<Exactly<int>>();
  }
  final m3 = 0;
}

class MA = Object with M;

main() {
  C1().m1.expectStaticType<Exactly<int>>();
  C1().m3.expectStaticType<Exactly<int>>();
  C2().m1.expectStaticType<Exactly<int>>();
  C2().m3.expectStaticType<Exactly<int>>();
  C3().m1.expectStaticType<Exactly<int>>();
  C3().m3.expectStaticType<Exactly<int>>();
  C4().m1.expectStaticType<Exactly<int>>();
  C4().m3.expectStaticType<Exactly<int>>();
  MA().m1.expectStaticType<Exactly<int>>();
  MA().m3.expectStaticType<Exactly<int>>();
  MC().m1.expectStaticType<Exactly<int>>();
  MC().m3.expectStaticType<Exactly<int>>();
  E1.e0.m1.expectStaticType<Exactly<int>>();
  E1.e0.m3.expectStaticType<Exactly<int>>();
}
