// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Note that override inference does not provide other properties of
/// a parameter than the type. E.g., it does not make a parameter `required`
/// based on overridden declarations. This property must then be specified
/// explicitly if needed.
///
/// @description Check that missing components of a method signature are
/// inferred as a combined member signature form a direct superinterface. Test
/// generics.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

mixin class A<T extends num> {
  T? m1() => null;
  void m2(T v) {}
  void m3([T? v]) {}
  void m4({T? v}) {}
  void m5({required T v}) {}
}

mixin class B<T extends int> {
  T? m1() => null;
  void m2(T v) {}
  void m3([T? v]) {}
  void m4({T? v}) {}
  void m5({required T v}) {}
}


class C1 extends A implements B {
  m1() => 0;
  void m2(v) {}
  void m3([v = 1]) {}
  void m4({v = 1}) {}
  void m5({required v}) {}
}

class C2 implements A, B {
  m1() => 0;
  void m2(v) {}
  void m3([v = 1]) {}
  void m4({v = 1}) {}
  void m5({required v}) {}
}

class C3 with A implements B {
  m1() => 0;
  void m2(v) {}
  void m3([v = 1]) {}
  void m4({v = 1}) {}
  void m5({required v}) {}
}

class C4 with B implements A {
  m1() => 0;
  void m2(v) {}
  void m3([v = 1]) {}
  void m4({v = 1}) {}
  void m5({required v}) {}
}

mixin M implements A, B {
  m1() => 0;
  void m2(v) {}
  void m3([v = 1]) {}
  void m4({v = 1}) {}
  void m5({required v}) {}
}

mixin class MC implements A, B {
  m1() => 0;
  void m2(v) {}
  void m3([v = 1]) {}
  void m4({v = 1}) {}
  void m5({required v}) {}
}

enum E1 implements A, B {
  e0;

  m1() => 0;
  void m2(v) {}
  void m3([v = 1]) {}
  void m4({v = 1}) {}
  void m5({required v}) {}
}

class MA = Object with M;

main() {
  C1().m1.expectStaticType<Exactly<int? Function()>>();
  C1().m2.expectStaticType<Exactly<void Function(num)>>();
  C1().m3.expectStaticType<Exactly<void Function([num?])>>();
  C1().m4.expectStaticType<Exactly<void Function({num? v})>>();
  C1().m5.expectStaticType<Exactly<void Function({required num v})>>();

  C2().m1.expectStaticType<Exactly<int? Function()>>();
  C2().m2.expectStaticType<Exactly<void Function(num)>>();
  C2().m3.expectStaticType<Exactly<void Function([num?])>>();
  C2().m4.expectStaticType<Exactly<void Function({num? v})>>();
  C2().m5.expectStaticType<Exactly<void Function({required num v})>>();

  C3().m1.expectStaticType<Exactly<int? Function()>>();
  C3().m2.expectStaticType<Exactly<void Function(num)>>();
  C3().m3.expectStaticType<Exactly<void Function([num?])>>();
  C3().m4.expectStaticType<Exactly<void Function({num? v})>>();
  C3().m5.expectStaticType<Exactly<void Function({required num v})>>();

  C4().m1.expectStaticType<Exactly<int? Function()>>();
  C4().m2.expectStaticType<Exactly<void Function(num)>>();
  C4().m3.expectStaticType<Exactly<void Function([num?])>>();
  C4().m4.expectStaticType<Exactly<void Function({num? v})>>();
  C4().m5.expectStaticType<Exactly<void Function({required num v})>>();

  MA().m1.expectStaticType<Exactly<int? Function()>>();
  MA().m2.expectStaticType<Exactly<void Function(num)>>();
  MA().m3.expectStaticType<Exactly<void Function([num?])>>();
  MA().m4.expectStaticType<Exactly<void Function({num? v})>>();
  MA().m5.expectStaticType<Exactly<void Function({required num v})>>();

  MC().m1.expectStaticType<Exactly<int? Function()>>();
  MC().m2.expectStaticType<Exactly<void Function(num)>>();
  MC().m3.expectStaticType<Exactly<void Function([num?])>>();
  MC().m4.expectStaticType<Exactly<void Function({num? v})>>();
  MC().m5.expectStaticType<Exactly<void Function({required num v})>>();

  E1.e0.m1.expectStaticType<Exactly<int? Function()>>();
  E1.e0.m2.expectStaticType<Exactly<void Function(num)>>();
  E1.e0.m3.expectStaticType<Exactly<void Function([num?])>>();
  E1.e0.m4.expectStaticType<Exactly<void Function({num? v})>>();
  E1.e0.m5.expectStaticType<Exactly<void Function({required num v})>>();
}
