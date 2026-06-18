// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The parameter type of a setter which overrides/implements both a
/// setter and a getter is inferred to be the parameter type of the combined
/// member signature of said setter in the direct superinterfaces.
///
/// @description Check that the parameter type of a setter which overrides both
/// a setter and a getter is inferred to be the parameter type of said setter in
/// the direct superinterface. Test generics.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

mixin class A<X extends int, Y extends num> {
  void set m1(X _) {}
  String get m1 => 'm1';
  void set m2(Y _) {}
  String get m2 => 'm2';
}

class C1 extends A {
  void set m1(v) {
    v.expectStaticType<Exactly<int>>();
  }
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
}

class C2 with A {
  void set m1(v) {
    v.expectStaticType<Exactly<int>>();
  }
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
}

mixin M on A {
  void set m1(v) {
    v.expectStaticType<Exactly<int>>();
  }
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
}

enum E with A {
  e0;

  void set m1(v) {
    v.expectStaticType<Exactly<int>>();
  }
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
}

class MA = A with M;

main() {
  C1().m1 = 1;
  C1().m2 = 2;
  C2().m1 = 1;
  C2().m2 = 2;
  MA().m1 = 1;
  MA().m2 = 2;
  E.e0.m1 = 1;
  E.e0.m2 = 2;
}
