// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The return type of a getter which overrides/implements both a
/// setter and a getter is inferred to be the return type of the combined member
/// signature of said getter in the direct superinterfaces.
///
/// @description Check that the return type of a getter which implements both a
/// setter and a getter is inferred to be the return type of said getter in the
/// direct superinterface.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

class A {
  num get m1 => 3.14;
  int get m2 => 42;
}

class B {
  void set m1(String _) {}
  void set m2(String _) {}
}

class C1 implements A, B {
  get m1 => 0;
  get m2 => 0;
  void set m1(_) {} // We need to implement setters as well
  void set m2(_) {}
}

class C2 implements B, A {
  get m1 => 0;
  get m2 => 0;
  void set m1(_) {}
  void set m2(_) {}
}

mixin M1 implements A, B {
  get m1 => 0;
  get m2 => 0;
  void set m1(_) {}
  void set m2(_) {}
}

mixin M2 implements B, A {
  get m1 => 0;
  get m2 => 0;
  void set m1(_) {}
  void set m2(_) {}
}

mixin class MC1 implements A, B {
  get m1 => 0;
  get m2 => 0;
  void set m1(_) {}
  void set m2(_) {}
}

mixin class MC2 implements B, A {
  get m1 => 0;
  get m2 => 0;
  void set m1(_) {}
  void set m2(_) {}
}

enum E1 implements A, B {
  e0;

  get m1 => 0;
  get m2 => 0;
  void set m1(_) {}
  void set m2(_) {}
}

enum E2 implements B, A {
  e0;

  get m1 => 0;
  get m2 => 0;
  void set m1(_) {}
  void set m2(_) {}
}

class MA1 = Object with M1;
class MA2 = Object with M2;

main() {
  C1().m1.expectStaticType<Exactly<num>>();
  C1().m2.expectStaticType<Exactly<int>>();
  C2().m1.expectStaticType<Exactly<num>>();
  C2().m2.expectStaticType<Exactly<int>>();
  MA1().m1.expectStaticType<Exactly<num>>();
  MA1().m2.expectStaticType<Exactly<int>>();
  MA2().m1.expectStaticType<Exactly<num>>();
  MA2().m2.expectStaticType<Exactly<int>>();
  MC1().m1.expectStaticType<Exactly<num>>();
  MC1().m2.expectStaticType<Exactly<int>>();
  MC2().m1.expectStaticType<Exactly<num>>();
  MC2().m2.expectStaticType<Exactly<int>>();
  E1.e0.m1.expectStaticType<Exactly<num>>();
  E1.e0.m2.expectStaticType<Exactly<int>>();
  E2.e0.m1.expectStaticType<Exactly<num>>();
  E2.e0.m2.expectStaticType<Exactly<int>>();
}
