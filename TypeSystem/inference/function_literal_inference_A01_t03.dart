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
/// @description Check that if the greatest closure of `K` is `S` and `S` is a
/// subtype of `Null`, then `T` is `Object?`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

void Function(Null) f1 = (n) {
  n.expectStaticType<Exactly<Object?>>();
};
void Function([Null]) f2 = ([n]) {
  n.expectStaticType<Exactly<Object?>>();
};
void Function({Null n}) f3 = ({n}) {
  n.expectStaticType<Exactly<Object?>>();
};
void Function({required Null n}) f4 = ({required n}) {
  n.expectStaticType<Exactly<Object?>>();
};

class C {
  static void Function(Null) sf1 = (n) {
    n.expectStaticType<Exactly<Object?>>();
  };
  static void Function([Null]) sf2 = ([n]) {
    n.expectStaticType<Exactly<Object?>>();
  };
  static void Function({Null n}) sf3 = ({n}) {
    n.expectStaticType<Exactly<Object?>>();
  };
  static void Function({required Null n}) sf4 = ({required n}) {
    n.expectStaticType<Exactly<Object?>>();
  };

  void Function(Null) f1 = (n) {
    n.expectStaticType<Exactly<Object?>>();
  };
  void Function([Null]) f2 = ([n]) {
    n.expectStaticType<Exactly<Object?>>();
  };
  void Function({Null n}) f3 = ({n}) {
    n.expectStaticType<Exactly<Object?>>();
  };
  void Function({required Null n}) f4 = ({required n}) {
    n.expectStaticType<Exactly<Object?>>();
  };
}

mixin M {
  static void Function(Null) sf1 = (n) {
    n.expectStaticType<Exactly<Object?>>();
  };
  static void Function([Null]) sf2 = ([n]) {
    n.expectStaticType<Exactly<Object?>>();
  };
  static void Function({Null n}) sf3 = ({n}) {
    n.expectStaticType<Exactly<Object?>>();
  };
  static void Function({required Null n}) sf4 = ({required n}) {
    n.expectStaticType<Exactly<Object?>>();
  };

  void Function(Null) f1 = (n) {
    n.expectStaticType<Exactly<Object?>>();
  };
  void Function([Null]) f2 = ([n]) {
    n.expectStaticType<Exactly<Object?>>();
  };
  void Function({Null n}) f3 = ({n}) {
    n.expectStaticType<Exactly<Object?>>();
  };
  void Function({required Null n}) f4 = ({required n}) {
    n.expectStaticType<Exactly<Object?>>();
  };
}

mixin class MC {
  static void Function(Null) sf1 = (n) {
    n.expectStaticType<Exactly<Object?>>();
  };
  static void Function([Null]) sf2 = ([n]) {
    n.expectStaticType<Exactly<Object?>>();
  };
  static void Function({Null n}) sf3 = ({n}) {
    n.expectStaticType<Exactly<Object?>>();
  };
  static void Function({required Null n}) sf4 = ({required n}) {
    n.expectStaticType<Exactly<Object?>>();
  };

  void Function(Null) f1 = (n) {
    n.expectStaticType<Exactly<Object?>>();
  };
  void Function([Null]) f2 = ([n]) {
    n.expectStaticType<Exactly<Object?>>();
  };
  void Function({Null n}) f3 = ({n}) {
    n.expectStaticType<Exactly<Object?>>();
  };
  void Function({required Null n}) f4 = ({required n}) {
    n.expectStaticType<Exactly<Object?>>();
  };
}

enum E {
  e0;
  static void Function(Null) sf1 = (n) {
    n.expectStaticType<Exactly<Object?>>();
  };
  static void Function([Null]) sf2 = ([n]) {
    n.expectStaticType<Exactly<Object?>>();
  };
  static void Function({Null n}) sf3 = ({n}) {
    n.expectStaticType<Exactly<Object?>>();
  };
  static void Function({required Null n}) sf4 = ({required n}) {
    n.expectStaticType<Exactly<Object?>>();
  };
}

class A {}

extension Ext on A {
  static void Function(Null) sf1 = (n) {
    n.expectStaticType<Exactly<Object?>>();
  };
  static void Function([Null]) sf2 = ([n]) {
    n.expectStaticType<Exactly<Object?>>();
  };
  static void Function({Null n}) sf3 = ({n}) {
    n.expectStaticType<Exactly<Object?>>();
  };
  static void Function({required Null n}) sf4 = ({required n}) {
    n.expectStaticType<Exactly<Object?>>();
  };
}

extension type ET(int _) {
  static void Function(Null) sf1 = (n) {
    n.expectStaticType<Exactly<Object?>>();
  };
  static void Function([Null]) sf2 = ([n]) {
    n.expectStaticType<Exactly<Object?>>();
  };
  static void Function({Null n}) sf3 = ({n}) {
    n.expectStaticType<Exactly<Object?>>();
  };
  static void Function({required Null n}) sf4 = ({required n}) {
    n.expectStaticType<Exactly<Object?>>();
  };
}

class MA = Object with M;

main() {
  f1(null);
  f2(null);
  f3(n: null);
  f4(n: null);

  C.sf1(null);
  C.sf2(null);
  C.sf3(n: null);
  C.sf4(n: null);
  C().f1(null);
  C().f2(null);
  C().f3(n: null);
  C().f4(n: null);

  M.sf1(null);
  M.sf2(null);
  M.sf3(n: null);
  M.sf4(n: null);
  MA().f1(null);
  MA().f2(null);
  MA().f3(n: null);
  MA().f4(n: null);

  MC.sf1(null);
  MC.sf2(null);
  MC.sf3(n: null);
  MC.sf4(n: null);
  MC().f1(null);
  MC().f2(null);
  MC().f3(n: null);
  MC().f4(n: null);

  E.sf1(null);
  E.sf2(null);
  E.sf3(n: null);
  E.sf4(n: null);
  Ext.sf1(null);
  Ext.sf2(null);
  Ext.sf3(n: null);
  Ext.sf4(n: null);
  ET.sf1(null);
  ET.sf2(null);
  ET.sf3(n: null);
  ET.sf4(n: null);
}
