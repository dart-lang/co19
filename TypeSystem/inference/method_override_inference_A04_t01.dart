// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Note that override inference does not provide other properties of
/// a parameter than the type. E.g., it does not make a parameter `required`
/// based on overridden declarations. This property must then be specified
/// explicitly if needed.
///
/// @description Checks that `required` keyword is not inferred.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

mixin class A {
  void m({required num v}) {}
}

class C1 extends A {
  void m({v = 0}) {}
}

class C2 implements A {
  void m({v = 0}) {}
}

class C3 with A {
  void m({v = 0}) {}
}

mixin M1 on A {
  void m({v = 0}) {}
}

mixin M2 implements A {
  void m({v = 0}) {}
}

mixin class MC implements A {
  void m({v = 0}) {}
}

enum E1 implements A {
  e0;

  void m({v = 0}) {}
}

enum E2 with A {
  e0;

  void m({v = 0}) {}
}

class MA1 = A with M1;
class MA2 = Object with M2;

main() {
  C1().m.expectStaticType<Exactly<void Function({num v})>>();
  C2().m.expectStaticType<Exactly<void Function({num v})>>();
  C3().m.expectStaticType<Exactly<void Function({num v})>>();
  MA1().m.expectStaticType<Exactly<void Function({num v})>>();
  MA2().m.expectStaticType<Exactly<void Function({num v})>>();
  MC().m.expectStaticType<Exactly<void Function({num v})>>();
  E1.e0.m.expectStaticType<Exactly<void Function({num v})>>();
  E2.e0.m.expectStaticType<Exactly<void Function({num v})>>();
}
