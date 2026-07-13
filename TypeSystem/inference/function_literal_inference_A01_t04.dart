// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Function literals which are inferred in an non-empty typing
/// context where the context type is a function type are inferred as described
/// below.
///
/// Each parameter is assumed to have its declared type if present. If no type
/// is declared for a parameter and there is a corresponding parameter in the
/// context type schema with type schema `K`, the parameter is given an inferred
/// type `T` where `T` is derived from `K` as follows. If the greatest closure
/// of `K` is `S` and `S` is a subtype of `Null`, then without null safety `T`
/// is `dynamic`, and with null safety `T` is `Object?`. Otherwise, `T` is `S`.
/// If there is no corresponding parameter in the context type schema, the
/// variable is treated as having type `dynamic`.
///
/// @description Checks if no type is declared for a parameter and there is a
/// corresponding parameter in the context type schema with a type schema, the
/// parameter type is inferred from the type schema. Test generic function
/// literals.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

void Function<X>(X) f1 = <X>(x) {
  x.expectStaticType<Exactly<X>>();
};
void Function<X>([X?]) f2 = <X>([x]) {
  x.expectStaticType<Exactly<X?>>();
};
void Function<X>({X? x}) f3 = <X>({x}) {
  x.expectStaticType<Exactly<X?>>();
};
void Function<X>({required X x}) f4 = <X>({required x}) {
  x.expectStaticType<Exactly<X>>();
};

class C {
  static void Function<X>(X) sf1 = <X>(x) {
    x.expectStaticType<Exactly<X>>();
  };
  static void Function<X>([X?]) sf2 = <X>([x]) {
    x.expectStaticType<Exactly<X?>>();
  };
  static void Function<X>({X? x}) sf3 = <X>({x}) {
    x.expectStaticType<Exactly<X?>>();
  };
  static void Function<X>({required X x}) sf4 = <X>({required x}) {
    x.expectStaticType<Exactly<X>>();
  };

  void Function<X>(X) f1 = <X>(x) {
    x.expectStaticType<Exactly<X>>();
  };
  void Function<X>([X?]) f2 = <X>([x]) {
    x.expectStaticType<Exactly<X?>>();
  };
  void Function<X>({X? x}) f3 = <X>({x}) {
    x.expectStaticType<Exactly<X?>>();
  };
  void Function<X>({required X x}) f4 = <X>({required x}) {
    x.expectStaticType<Exactly<X>>();
  };
}

mixin M {
  static void Function<X>(X) sf1 = <X>(x) {
    x.expectStaticType<Exactly<X>>();
  };
  static void Function<X>([X?]) sf2 = <X>([x]) {
    x.expectStaticType<Exactly<X?>>();
  };
  static void Function<X>({X? x}) sf3 = <X>({x}) {
    x.expectStaticType<Exactly<X?>>();
  };
  static void Function<X>({required X x}) sf4 = <X>({required x}) {
    x.expectStaticType<Exactly<X>>();
  };

  void Function<X>(X) f1 = <X>(x) {
    x.expectStaticType<Exactly<X>>();
  };
  void Function<X>([X?]) f2 = <X>([x]) {
    x.expectStaticType<Exactly<X?>>();
  };
  void Function<X>({X? x}) f3 = <X>({x}) {
    x.expectStaticType<Exactly<X?>>();
  };
  void Function<X>({required X x}) f4 = <X>({required x}) {
    x.expectStaticType<Exactly<X>>();
  };
}

mixin class MC {
  static void Function<X>(X) sf1 = <X>(x) {
    x.expectStaticType<Exactly<X>>();
  };
  static void Function<X>([X?]) sf2 = <X>([x]) {
    x.expectStaticType<Exactly<X?>>();
  };
  static void Function<X>({X? x}) sf3 = <X>({x}) {
    x.expectStaticType<Exactly<X?>>();
  };
  static void Function<X>({required X x}) sf4 = <X>({required x}) {
    x.expectStaticType<Exactly<X>>();
  };

  void Function<X>(X) f1 = <X>(x) {
    x.expectStaticType<Exactly<X>>();
  };
  void Function<X>([X?]) f2 = <X>([x]) {
    x.expectStaticType<Exactly<X?>>();
  };
  void Function<X>({X? x}) f3 = <X>({x}) {
    x.expectStaticType<Exactly<X?>>();
  };
  void Function<X>({required X x}) f4 = <X>({required x}) {
    x.expectStaticType<Exactly<X>>();
  };
}

enum E {
  e0;

  static void Function<X>(X) sf1 = <X>(x) {
    x.expectStaticType<Exactly<X>>();
  };
  static void Function<X>([X?]) sf2 = <X>([x]) {
    x.expectStaticType<Exactly<X?>>();
  };
  static void Function<X>({X? x}) sf3 = <X>({x}) {
    x.expectStaticType<Exactly<X?>>();
  };
  static void Function<X>({required X x}) sf4 = <X>({required x}) {
    x.expectStaticType<Exactly<X>>();
  };
}

class A {}

extension Ext on A {
  static void Function<X>(X) sf1 = <X>(x) {
    x.expectStaticType<Exactly<X>>();
  };
  static void Function<X>([X?]) sf2 = <X>([x]) {
    x.expectStaticType<Exactly<X?>>();
  };
  static void Function<X>({X? x}) sf3 = <X>({x}) {
    x.expectStaticType<Exactly<X?>>();
  };
  static void Function<X>({required X x}) sf4 = <X>({required x}) {
    x.expectStaticType<Exactly<X>>();
  };
}

extension type ET(int _) {
  static void Function<X>(X) sf1 = <X>(x) {
    x.expectStaticType<Exactly<X>>();
  };
  static void Function<X>([X?]) sf2 = <X>([x]) {
    x.expectStaticType<Exactly<X?>>();
  };
  static void Function<X>({X? x}) sf3 = <X>({x}) {
    x.expectStaticType<Exactly<X?>>();
  };
  static void Function<X>({required X x}) sf4 = <X>({required x}) {
    x.expectStaticType<Exactly<X>>();
  };
}

class MA = Object with M;

main() {
  f1<int>(1);
  f2<int>(2);
  f3<int>(x: 3);
  f4<int>(x: 4);

  C.sf1<int>(1);
  C.sf2<int>(2);
  C.sf3<int>(x: 3);
  C.sf4<int>(x: 4);
  C().f1<int>(1);
  C().f2<int>(2);
  C().f3<int>(x: 3);
  C().f4<int>(x: 4);

  M.sf1<int>(1);
  M.sf2<int>(2);
  M.sf3<int>(x: 3);
  M.sf4<int>(x: 4);
  MA().f1<int>(1);
  MA().f2<int>(2);
  MA().f3<int>(x: 3);
  MA().f4<int>(x: 4);

  MC.sf1<int>(1);
  MC.sf2<int>(2);
  MC.sf3<int>(x: 3);
  MC.sf4<int>(x: 4);
  MC().f1<int>(1);
  MC().f2<int>(2);
  MC().f3<int>(x: 3);
  MC().f4<int>(x: 4);

  E.sf1<int>(1);
  E.sf2<int>(2);
  E.sf3<int>(x: 3);
  E.sf4<int>(x: 4);

  Ext.sf1<int>(1);
  Ext.sf2<int>(2);
  Ext.sf3<int>(x: 3);
  Ext.sf4<int>(x: 4);

  ET.sf1<int>(1);
  ET.sf2<int>(2);
  ET.sf3<int>(x: 3);
  ET.sf4<int>(x: 4);
}
