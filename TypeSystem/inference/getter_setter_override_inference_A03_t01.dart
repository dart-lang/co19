// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The return type of a getter which overrides/implements both a
/// setter and a getter is inferred to be the return type of the combined member
/// signature of said getter in the direct superinterfaces.
///
/// @description Check that the return type of a getter which overrides both a
/// setter and a getter is inferred to be the return type of said getter in the
/// direct superinterface.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

mixin class A {
  void set m1(String _) {}
  num get m1 => 3.14;
  void set m2(String _) {}
  int get m2 => 42;
}

class C1 extends A {
  get m1 => 0;
  get m2 => 0;
}

class C2 with A {
  get m1 => 0;
  get m2 => 0;
}

mixin M on A {
  get m1 => 0;
  get m2 => 0;
}

enum E with A {
  e0;

  get m1 => 0;
  get m2 => 0;
}

class MA = A with M;

main() {
  C1().m1.expectStaticType<Exactly<num>>();
  C1().m2.expectStaticType<Exactly<int>>();
  C2().m1.expectStaticType<Exactly<num>>();
  C2().m2.expectStaticType<Exactly<int>>();
  MA().m1.expectStaticType<Exactly<num>>();
  MA().m2.expectStaticType<Exactly<int>>();
  E.e0.m1.expectStaticType<Exactly<num>>();
  E.e0.m2.expectStaticType<Exactly<int>>();
}
