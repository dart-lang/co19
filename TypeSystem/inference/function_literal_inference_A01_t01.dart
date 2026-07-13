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
/// parameter type is inferred from the type schema.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

void Function(num) f1 = (n) {
  n.expectStaticType<Exactly<num>>();
};
void Function([num]) f2 = ([n = 0]) {
  n.expectStaticType<Exactly<num>>();
};
void Function({num n}) f3 = ({n = 0}) {
  n.expectStaticType<Exactly<num>>();
};
void Function({required num n}) f4 = ({required n}) {
  n.expectStaticType<Exactly<num>>();
};

class C {
  static void Function(num) sf1 = (n) {
    n.expectStaticType<Exactly<num>>();
  };
  static void Function([num]) sf2 = ([n = 0]) {
    n.expectStaticType<Exactly<num>>();
  };
  static void Function({num n}) sf3 = ({n = 0}) {
    n.expectStaticType<Exactly<num>>();
  };
  static void Function({required num n}) sf4 = ({required n}) {
    n.expectStaticType<Exactly<num>>();
  };

  void Function(num) f1 = (n) {
    n.expectStaticType<Exactly<num>>();
  };
  void Function([num]) f2 = ([n = 0]) {
    n.expectStaticType<Exactly<num>>();
  };
  void Function({num n}) f3 = ({n = 0}) {
    n.expectStaticType<Exactly<num>>();
  };
  void Function({required num n}) f4 = ({required n}) {
    n.expectStaticType<Exactly<num>>();
  };
}

mixin M {
  static void Function(num) sf1 = (n) {
    n.expectStaticType<Exactly<num>>();
  };
  static void Function([num]) sf2 = ([n = 0]) {
    n.expectStaticType<Exactly<num>>();
  };
  static void Function({num n}) sf3 = ({n = 0}) {
    n.expectStaticType<Exactly<num>>();
  };
  static void Function({required num n}) sf4 = ({required n}) {
    n.expectStaticType<Exactly<num>>();
  };

  void Function(num) f1 = (n) {
    n.expectStaticType<Exactly<num>>();
  };
  void Function([num]) f2 = ([n = 0]) {
    n.expectStaticType<Exactly<num>>();
  };
  void Function({num n}) f3 = ({n = 0}) {
    n.expectStaticType<Exactly<num>>();
  };
  void Function({required num n}) f4 = ({required n}) {
    n.expectStaticType<Exactly<num>>();
  };
}

mixin class MC {
  static void Function(num) sf1 = (n) {
    n.expectStaticType<Exactly<num>>();
  };
  static void Function([num]) sf2 = ([n = 0]) {
    n.expectStaticType<Exactly<num>>();
  };
  static void Function({num n}) sf3 = ({n = 0}) {
    n.expectStaticType<Exactly<num>>();
  };
  static void Function({required num n}) sf4 = ({required n}) {
    n.expectStaticType<Exactly<num>>();
  };

  void Function(num) f1 = (n) {
    n.expectStaticType<Exactly<num>>();
  };
  void Function([num]) f2 = ([n = 0]) {
    n.expectStaticType<Exactly<num>>();
  };
  void Function({num n}) f3 = ({n = 0}) {
    n.expectStaticType<Exactly<num>>();
  };
  void Function({required num n}) f4 = ({required n}) {
    n.expectStaticType<Exactly<num>>();
  };
}

enum E {
  e0;

  static void Function(num) sf1 = (n) {
    n.expectStaticType<Exactly<num>>();
  };
  static void Function([num]) sf2 = ([n = 0]) {
    n.expectStaticType<Exactly<num>>();
  };
  static void Function({num n}) sf3 = ({n = 0}) {
    n.expectStaticType<Exactly<num>>();
  };
  static void Function({required num n}) sf4 = ({required n}) {
    n.expectStaticType<Exactly<num>>();
  };
}

class A {}

extension Ext on A {
  static void Function(num) sf1 = (n) {
    n.expectStaticType<Exactly<num>>();
  };
  static void Function([num]) sf2 = ([n = 0]) {
    n.expectStaticType<Exactly<num>>();
  };
  static void Function({num n}) sf3 = ({n = 0}) {
    n.expectStaticType<Exactly<num>>();
  };
  static void Function({required num n}) sf4 = ({required n}) {
    n.expectStaticType<Exactly<num>>();
  };
}

extension type ET(int _) {
  static void Function(num) sf1 = (n) {
    n.expectStaticType<Exactly<num>>();
  };
  static void Function([num]) sf2 = ([n = 0]) {
    n.expectStaticType<Exactly<num>>();
  };
  static void Function({num n}) sf3 = ({n = 0}) {
    n.expectStaticType<Exactly<num>>();
  };
  static void Function({required num n}) sf4 = ({required n}) {
    n.expectStaticType<Exactly<num>>();
  };
}

class MA = Object with M;

main() {
  f1(1);
  f2(2);
  f3(n: 3);
  f4(n: 4);

  C.sf1(1);
  C.sf2(2);
  C.sf3(n: 3);
  C.sf4(n: 4);
  C().f1(1);
  C().f2(2);
  C().f3(n: 3);
  C().f4(n: 4);

  M.sf1(1);
  M.sf2(2);
  M.sf3(n: 3);
  M.sf4(n: 4);
  MA().f1(1);
  MA().f2(2);
  MA().f3(n: 3);
  MA().f4(n: 4);

  MC.sf1(1);
  MC.sf2(2);
  MC.sf3(n: 3);
  MC.sf4(n: 4);
  MC().f1(1);
  MC().f2(2);
  MC().f3(n: 3);
  MC().f4(n: 4);

  E.sf1(1);
  E.sf2(2);
  E.sf3(n: 3);
  E.sf4(n: 4);

  Ext.sf1(1);
  Ext.sf2(2);
  Ext.sf3(n: 3);
  Ext.sf4(n: 4);

  ET.sf1(1);
  ET.sf2(2);
  ET.sf3(n: 3);
  ET.sf4(n: 4);
}
