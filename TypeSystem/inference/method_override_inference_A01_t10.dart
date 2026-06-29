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
/// inferred from a direct superinterface. Test generic methods.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

abstract mixin class A {
  T? m1<T extends num>();
  void m2<T extends num>(T v) {}
  void m3<T extends num>([T? v]) {}
  void m4<T extends num>({T? v}) {}
  void m5<T extends num>({required T v}) {}
}

class C1 extends A {
  m1<T extends num>() => null;
  void m2<T extends num>(v) {}
  void m3<T extends num>([v]) {}
  void m4<T extends num>({v}) {}
  void m5<T extends num>({required v}) {}
}

class C2 implements A {
  m1<T extends num>() => null;
  void m2<T extends num>(v) {}
  void m3<T extends num>([v]) {}
  void m4<T extends num>({v}) {}
  void m5<T extends num>({required v}) {}
}

class C3 with A {
  m1<T extends num>() => null;
  void m2<T extends num>(v) {}
  void m3<T extends num>([v]) {}
  void m4<T extends num>({v}) {}
  void m5<T extends num>({required v}) {}
}

mixin M1 on A {
  m1<T extends num>() => null;
  void m2<T extends num>(v) {}
  void m3<T extends num>([v]) {}
  void m4<T extends num>({v}) {}
  void m5<T extends num>({required v}) {}
}

mixin M2 implements A {
  m1<T extends num>() => null;
  void m2<T extends num>(v) {}
  void m3<T extends num>([v]) {}
  void m4<T extends num>({v}) {}
  void m5<T extends num>({required v}) {}
}

mixin class MC implements A {
  m1<T extends num>() => null;
  void m2<T extends num>(v) {}
  void m3<T extends num>([v]) {}
  void m4<T extends num>({v}) {}
  void m5<T extends num>({required v}) {}
}

enum E1 implements A {
  e0;

  m1<T extends num>() => null;
  void m2<T extends num>(v) {}
  void m3<T extends num>([v]) {}
  void m4<T extends num>({v}) {}
  void m5<T extends num>({required v}) {}
}

enum E2 with A {
  e0;

  m1<T extends num>() => null;
  void m2<T extends num>(v) {}
  void m3<T extends num>([v]) {}
  void m4<T extends num>({v}) {}
  void m5<T extends num>({required v}) {}
}

class MA1 = A with M1;
class MA2 = Object with M2;

main() {
  C1().m1.expectStaticType<Exactly<T? Function<T extends num>()>>();
  C1().m2.expectStaticType<Exactly<void Function<T extends num>(T)>>();
  C1().m3.expectStaticType<Exactly<void Function<T extends num>([T?])>>();
  C1().m4.expectStaticType<Exactly<void Function<T extends num>({T? v})>>();
  C1().m5
      .expectStaticType<
        Exactly<void Function<T extends num>({required T v})>
      >();

  C2().m1.expectStaticType<Exactly<T? Function<T extends num>()>>();
  C2().m2.expectStaticType<Exactly<void Function<T extends num>(T)>>();
  C2().m3.expectStaticType<Exactly<void Function<T extends num>([T?])>>();
  C2().m4.expectStaticType<Exactly<void Function<T extends num>({T? v})>>();
  C2().m5
      .expectStaticType<
        Exactly<void Function<T extends num>({required T v})>
      >();

  C3().m1.expectStaticType<Exactly<T? Function<T extends num>()>>();
  C3().m2.expectStaticType<Exactly<void Function<T extends num>(T)>>();
  C3().m3.expectStaticType<Exactly<void Function<T extends num>([T?])>>();
  C3().m4.expectStaticType<Exactly<void Function<T extends num>({T? v})>>();
  C3().m5
      .expectStaticType<
        Exactly<void Function<T extends num>({required T v})>
      >();

  MA1().m1.expectStaticType<Exactly<T? Function<T extends num>()>>();
  MA1().m2.expectStaticType<Exactly<void Function<T extends num>(T)>>();
  MA1().m3.expectStaticType<Exactly<void Function<T extends num>([T?])>>();
  MA1().m4.expectStaticType<Exactly<void Function<T extends num>({T? v})>>();
  MA1().m5
      .expectStaticType<
        Exactly<void Function<T extends num>({required T v})>
      >();

  MA2().m1.expectStaticType<Exactly<T? Function<T extends num>()>>();
  MA2().m2.expectStaticType<Exactly<void Function<T extends num>(T)>>();
  MA2().m3.expectStaticType<Exactly<void Function<T extends num>([T?])>>();
  MA2().m4.expectStaticType<Exactly<void Function<T extends num>({T? v})>>();
  MA2().m5
      .expectStaticType<
        Exactly<void Function<T extends num>({required T v})>
      >();

  MC().m1.expectStaticType<Exactly<T? Function<T extends num>()>>();
  MC().m2.expectStaticType<Exactly<void Function<T extends num>(T)>>();
  MC().m3.expectStaticType<Exactly<void Function<T extends num>([T?])>>();
  MC().m4.expectStaticType<Exactly<void Function<T extends num>({T? v})>>();
  MC().m5
      .expectStaticType<
        Exactly<void Function<T extends num>({required T v})>
      >();

  E1.e0.m1.expectStaticType<Exactly<T? Function<T extends num>()>>();
  E1.e0.m2.expectStaticType<Exactly<void Function<T extends num>(T)>>();
  E1.e0.m3.expectStaticType<Exactly<void Function<T extends num>([T?])>>();
  E1.e0.m4.expectStaticType<Exactly<void Function<T extends num>({T? v})>>();
  E1.e0.m5
      .expectStaticType<
        Exactly<void Function<T extends num>({required T v})>
      >();

  E2.e0.m1.expectStaticType<Exactly<T? Function<T extends num>()>>();
  E2.e0.m2.expectStaticType<Exactly<void Function<T extends num>(T)>>();
  E2.e0.m3.expectStaticType<Exactly<void Function<T extends num>([T?])>>();
  E2.e0.m4.expectStaticType<Exactly<void Function<T extends num>({T? v})>>();
  E2.e0.m5
      .expectStaticType<
        Exactly<void Function<T extends num>({required T v})>
      >();
}
