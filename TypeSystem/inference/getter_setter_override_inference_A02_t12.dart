// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The return type of a getter, parameter type of a setter or type
/// of a field which overrides/implements only one or more setters is inferred
/// to be the parameter type of the combined member signature of said setter in
/// the direct superinterfaces.
///
/// @description Checks that the return type of a getter/field or parameter type
/// of a setter is inferred as a combined member signature of said getters in
/// the direct superinterface. Test a type parameter which is instantiated
/// explicitly.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

mixin class A<T> {
  void set m1(T _) {}
  void set m2(T _) {}
  void set m3(T _) {}
}

mixin class B<T> {
  void set m1(T _) {}
  void set m2(T _) {}
  void set m3(T _) {}
}

class C1 extends A<num> implements B<int> {
  get m1 => 0;
  void set m1(_) {} // We need to implement a getter as well
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
  final m3 = 0;
  void set m3(_) {}
}

class C2 implements A<num>, B<int> {
  get m1 => 0;
  void set m1(_) {}
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
  final m3 = 0;
  void set m3(_) {}
}

class C3 with A<num> implements B<int> {
  get m1 => 0;
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
  final m3 = 0;
}

class C4 with B<int> implements A<num> {
  get m1 => 0;
  void set m1(_) {}
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
  final m3 = 0;
  void set m3(_) {}
}

mixin M1 implements A<num>, B<int> {
  get m1 => 0;
  void set m1(_) {}
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
  final m3 = 0;
  void set m3(_) {}
}

mixin M2 on A<num>, B<int> {
  get m1 => 0;
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
  final m3 = 0;
  test() {
    m1.expectStaticType<Exactly<num>>();
    m3.expectStaticType<Exactly<num>>();
  }
}

mixin class MC implements A<num>, B<int> {
  get m1 => 0;
  void set m1(_) {}
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
  final m3 = 0;
  void set m3(_) {}
}

enum E1 implements A<num>, B<int> {
  e0;

  get m1 => 0;
  void set m1(_) {}
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
  final m3 = 0;
  void set m3(_) {}
}

class MA = Object with M1;

main() {
  C1().m1.expectStaticType<Exactly<num>>();
  C1().m3.expectStaticType<Exactly<num>>();
  C2().m1.expectStaticType<Exactly<num>>();
  C2().m3.expectStaticType<Exactly<num>>();
  C3().m1.expectStaticType<Exactly<num>>();
  C3().m3.expectStaticType<Exactly<num>>();
  C4().m1.expectStaticType<Exactly<num>>();
  C4().m3.expectStaticType<Exactly<num>>();
  MA().m1.expectStaticType<Exactly<num>>();
  MA().m3.expectStaticType<Exactly<num>>();
  MC().m1.expectStaticType<Exactly<num>>();
  MC().m3.expectStaticType<Exactly<num>>();
  E1.e0.m1.expectStaticType<Exactly<num>>();
  E1.e0.m3.expectStaticType<Exactly<num>>();
}
