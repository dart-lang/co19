// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The parameter type of a setter which overrides/implements both a
/// setter and a getter is inferred to be the parameter type of the combined
/// member signature of said setter in the direct superinterfaces.
///
/// @description Check that the parameter type of a setter which implements both
/// a setter and a getter is inferred to be the parameter type of the combined
/// member signature of said setter in the direct superinterfaces.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

class A {
  void set m1(int _) {}
  String get m1 => 'm1';
  void set m2(num _) {}
  String get m2 => 'm2';
}

class B {
  void set m1(num _) {}
  String get m1 => 'm1';
  void set m2(int _) {}
  String get m2 => 'm2';
}

class C implements A, B {
  void set m1(v) {
    v.expectStaticType<Exactly<num>>();
  }
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
  get m1 => '0'; // We need to implement getters as well
  get m2 => '0';
}

mixin M on A, B {
  void set m1(v) {
    v.expectStaticType<Exactly<num>>();
  }
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
  get m1 => '0';
  get m2 => '0';
}

mixin class MC implements A, B {
  void set m1(v) {
    v.expectStaticType<Exactly<num>>();
  }
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
  get m1 => '0';
  get m2 => '0';
}

enum E implements A, B {
  e0;

  void set m1(v) {
    v.expectStaticType<Exactly<num>>();
  }
  void set m2(v) {
    v.expectStaticType<Exactly<num>>();
  }
  get m1 => '0';
  get m2 => '0';
}

main() {
  C().m1 = 1;
  C().m2 = 2;
  MC().m1 = 1;
  MC().m2 = 2;
  E.e0.m1 = 1;
  E.e0.m2 = 2;
  print(M);
}
