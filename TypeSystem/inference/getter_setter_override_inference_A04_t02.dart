// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The parameter type of a setter which overrides/implements both a
/// setter and a getter is inferred to be the parameter type of the combined
/// member signature of said setter in the direct superinterfaces.
///
/// @description Check that the parameter type of a setter which implements both
/// a setter and a getter is inferred to be the parameter type of said setter in
/// the direct superinterface.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

class A {
  void set m1(int _) {}
  void set m2(num _) {}
}

class B {
  String get m1 => 'm1';
  String get m2 => 'm2';
}

class C1 implements A, B {
  void set m1(v) {
    v.expectStaticType<Exactly<int>>();
  }
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
  get m1 => 'm1'; // We need to implement getters as well
  get m2 => 'm2';
}

class C2 implements B, A {
  void set m1(v) {
    v.expectStaticType<Exactly<int>>();
  }
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
  get m1 => 'm1';
  get m2 => 'm2';
}

mixin M1 implements A, B {
  void set m1(v) {
    v.expectStaticType<Exactly<int>>();
  }
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
  get m1 => 'm1';
  get m2 => 'm2';
}

mixin M2 implements B, A {
  void set m1(v) {
    v.expectStaticType<Exactly<int>>();
  }
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
  get m1 => 'm1';
  get m2 => 'm2';
}

mixin class MC1 implements A, B {
  void set m1(v) {
    v.expectStaticType<Exactly<int>>();
  }
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
  get m1 => 'm1';
  get m2 => 'm2';
}

mixin class MC2 implements B, A {
  void set m1(v) {
    v.expectStaticType<Exactly<int>>();
  }
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
  get m1 => 'm1';
  get m2 => 'm2';
}

enum E1 implements A, B {
  e0;

  void set m1(v) {
    v.expectStaticType<Exactly<int>>();
  }
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
  get m1 => 'm1';
  get m2 => 'm2';
}

enum E2 implements B, A {
  e0;

  void set m1(v) {
    v.expectStaticType<Exactly<int>>();
  }
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
  get m1 => 'm1';
  get m2 => 'm2';
}

class MA1 = Object with M1;
class MA2 = Object with M2;

main() {
  C1().m1 = 1;
  C1().m2 = 2;
  C2().m1 = 1;
  C2().m2 = 2;
  MA1().m1 = 1;
  MA1().m2 = 2;
  MA2().m1 = 1;
  MA2().m2 = 2;
  MC1().m1 = 1;
  MC1().m2 = 2;
  MC2().m1 = 1;
  MC2().m2 = 2;
  E1.e0.m1 = 1;
  E1.e0.m2 = 2;
  E2.e0.m1 = 1;
  E2.e0.m2 = 2;
}
