// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The return type of a getter, parameter type of a setter or type
/// of a field which overrides/implements only one or more setters is inferred
/// to be the parameter type of the combined member signature of said setter in
/// the direct superinterfaces.
///
/// @description Checks that the return type of a getter/field or parameter type
/// of a setter can be inferred from an abstract setter in the direct
/// superinterface.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

abstract mixin class A {
  void set m1(num _);
  void set m2(num _);
  void set m3(num _);
}

class C1 extends A {
  get m1 => 0;
  void set m1(_) {}
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
  final m3 = 0;
  void set m3(_) {}
}

class C2 implements A {
  get m1 => 0;
  void set m1(_) {} // We need to implement a setter as well
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
  final m3 = 0;
  void set m3(_) {}
}

class C3 with A {
  get m1 => 0;
  void set m1(_) {}
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
  final m3 = 0;
  void set m3(_) {}
}

mixin M1 on A {
  get m1 => 0;
  void set m1(_) {}
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
  final m3 = 0;
  void set m3(_) {}
}

mixin M2 implements A {
  get m1 => 0;
  void set m1(_) {}
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
  final m3 = 0;
  void set m3(_) {}
}

mixin class MC implements A {
  get m1 => 0;
  void set m1(_) {}
  get m2 => 0;
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
  final m3 = 0;
  void set m3(_) {}
}

enum E1 implements A {
  e0;

  get m1 => 0;
  void set m1(_) {}
  get m2 => 0;
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
  final m3 = 0;
  void set m3(_) {}
}

enum E2 with A {
  e0;

  get m1 => 0;
  void set m1(_) {}
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
  final m3 = 0;
  void set m3(_) {}
}

class MA1 = A with M1;
class MA2 = Object with M2;

main() {
  C1().m1.expectStaticType<Exactly<num>>();
  C1().m3.expectStaticType<Exactly<num>>();
  C2().m1.expectStaticType<Exactly<num>>();
  C2().m3.expectStaticType<Exactly<num>>();
  C3().m1.expectStaticType<Exactly<num>>();
  C3().m3.expectStaticType<Exactly<num>>();
  MA1().m1.expectStaticType<Exactly<num>>();
  MA1().m3.expectStaticType<Exactly<num>>();
  MA2().m1.expectStaticType<Exactly<num>>();
  MA2().m3.expectStaticType<Exactly<num>>();
  MC().m1.expectStaticType<Exactly<num>>();
  MC().m3.expectStaticType<Exactly<num>>();
  E1.e0.m1.expectStaticType<Exactly<num>>();
  E1.e0.m3.expectStaticType<Exactly<num>>();
  E2.e0.m1.expectStaticType<Exactly<num>>();
  E2.e0.m3.expectStaticType<Exactly<num>>();
}
