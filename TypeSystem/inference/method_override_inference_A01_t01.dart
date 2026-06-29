// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A method `m` of a class `C` is subject to override inference if
/// it is missing one or more component types of its signature, and one or more
/// of the direct superinterfaces of `C` has a member named `m` (that is, `C.m`
/// overrides one or more declarations). Each missing type is filled in with the
/// corresponding type from the combined member signature `s` of `m` in the
/// direct superinterfaces of `C`.
///
/// @description Checks that missing components of a method signature can be
/// inferred from a direct superinterface.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

mixin class A {
  num m1() => 3.14;
  void m2(num v) {}
  void m3([num v = 0]) {}
  void m4({num v = 0}) {}
  void m5({required num v}) {}
}

class C1 extends A {
  m1() => 0;
  void m2(v) {}
  void m3([v = 1]) {}
  void m4({v = 1}) {}
  void m5({required v}) {}
}

class C2 implements A {
  m1() => 0;
  void m2(v) {}
  void m3([v = 1]) {}
  void m4({v = 1}) {}
  void m5({required v}) {}
}

class C3 with A {
  m1() => 0;
  void m2(v) {}
  void m3([v = 1]) {}
  void m4({v = 1}) {}
  void m5({required v}) {}
}

mixin M1 on A {
  m1() => 0;
  void m2(v) {}
  void m3([v = 1]) {}
  void m4({v = 1}) {}
  void m5({required v}) {}
}

mixin M2 implements A {
  m1() => 0;
  void m2(v) {}
  void m3([v = 1]) {}
  void m4({v = 1}) {}
  void m5({required v}) {}
}

mixin class MC implements A {
  m1() => 0;
  void m2(v) {}
  void m3([v = 1]) {}
  void m4({v = 1}) {}
  void m5({required v}) {}
}

enum E1 implements A {
  e0;

  m1() => 0;
  void m2(v) {}
  void m3([v = 1]) {}
  void m4({v = 1}) {}
  void m5({required v}) {}
}

enum E2 with A {
  e0;

  m1() => 0;
  void m2(v) {}
  void m3([v = 1]) {}
  void m4({v = 1}) {}
  void m5({required v}) {}
}

class MA1 = A with M1;
class MA2 = Object with M2;

main() {
  C1().m1.expectStaticType<Exactly<num Function()>>();
  C1().m2.expectStaticType<Exactly<void Function(num)>>();
  C1().m3.expectStaticType<Exactly<void Function([num])>>();
  C1().m4.expectStaticType<Exactly<void Function({num v})>>();
  C1().m5.expectStaticType<Exactly<void Function({required num v})>>();

  C2().m1.expectStaticType<Exactly<num Function()>>();
  C2().m2.expectStaticType<Exactly<void Function(num)>>();
  C2().m3.expectStaticType<Exactly<void Function([num])>>();
  C2().m4.expectStaticType<Exactly<void Function({num v})>>();
  C2().m5.expectStaticType<Exactly<void Function({required num v})>>();

  C3().m1.expectStaticType<Exactly<num Function()>>();
  C3().m2.expectStaticType<Exactly<void Function(num)>>();
  C3().m3.expectStaticType<Exactly<void Function([num])>>();
  C3().m4.expectStaticType<Exactly<void Function({num v})>>();
  C3().m5.expectStaticType<Exactly<void Function({required num v})>>();

  MA1().m1.expectStaticType<Exactly<num Function()>>();
  MA1().m2.expectStaticType<Exactly<void Function(num)>>();
  MA1().m3.expectStaticType<Exactly<void Function([num])>>();
  MA1().m4.expectStaticType<Exactly<void Function({num v})>>();
  MA1().m5.expectStaticType<Exactly<void Function({required num v})>>();

  MA2().m1.expectStaticType<Exactly<num Function()>>();
  MA2().m2.expectStaticType<Exactly<void Function(num)>>();
  MA2().m3.expectStaticType<Exactly<void Function([num])>>();
  MA2().m4.expectStaticType<Exactly<void Function({num v})>>();
  MA2().m5.expectStaticType<Exactly<void Function({required num v})>>();

  MC().m1.expectStaticType<Exactly<num Function()>>();
  MC().m2.expectStaticType<Exactly<void Function(num)>>();
  MC().m3.expectStaticType<Exactly<void Function([num])>>();
  MC().m4.expectStaticType<Exactly<void Function({num v})>>();
  MC().m5.expectStaticType<Exactly<void Function({required num v})>>();

  E1.e0.m1.expectStaticType<Exactly<num Function()>>();
  E1.e0.m2.expectStaticType<Exactly<void Function(num)>>();
  E1.e0.m3.expectStaticType<Exactly<void Function([num])>>();
  E1.e0.m4.expectStaticType<Exactly<void Function({num v})>>();
  E1.e0.m5.expectStaticType<Exactly<void Function({required num v})>>();

  E2.e0.m1.expectStaticType<Exactly<num Function()>>();
  E2.e0.m2.expectStaticType<Exactly<void Function(num)>>();
  E2.e0.m3.expectStaticType<Exactly<void Function([num])>>();
  E2.e0.m4.expectStaticType<Exactly<void Function({num v})>>();
  E2.e0.m5.expectStaticType<Exactly<void Function({required num v})>>();
}
