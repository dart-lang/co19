// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A potentially constant expression is an expression that will
/// generally yield a constant value when the values of certain parameters are
/// given. The constant expressions is a subset of the potentially constant
/// expressions that can be evaluated at compile time.
/// ...
/// The potentially constant expressions and constant expressions are the
/// following:
/// ...
/// - An expression of the form `e1?e2:e3` is potentially constant if `e1`,
///   `e2`, and `e3` are all potentially constant expressions. It is further
///   constant if `e1` is a constant expression and either
///   1. `e1` evaluates to true and `e2` is a constant expression, or
///   2. `e1` evaluates to false and `e3` is a constant expression.
///
/// @description Checks that an expression of the form `e1 ? e2 : e3` is not a
/// constant if `e1` and `e2` are constants but `e3` is not potentially constant
/// @author sgrekhov22@gmail.com
/// @issue 63144

class C {
  static const int one = 1;
  static int two = 2;   // Not potentially constant
}

mixin M {
  static const int one = 1;
  static int two = 2;
}

enum E {
  e1, e2;
  static const int one = 1;
  static int two = 2;
}

class A {}

extension Ext on A {
  static const int one = 1;
  static int two = 2;
}

extension type const ET(int v) {
  static const int one = 1;
  static int two = 2;
}

main() {
  const c1 = 1 < 2 ? C.one : C.two;
//                           ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c2 = 1 > 2 ? C.one : C.two;
//                           ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const m1 = 1 < 2 ? M.one : M.two;
//                           ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const m2 = 1 > 2 ? M.one : M.two;
//                           ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const e1 = 1 < 2 ? E.one : E.two;
//                           ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const e2 = 1 > 2 ? E.one : E.two;
//                           ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const a1 = 1 < 2 ? Ext.one : Ext.two;
//                             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const a2 = 1 > 2 ? Ext.one : Ext.two;
//                             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const et1 = 1 < 2 ? ET.one : ET.two;
//                             ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const et2 = 1 > 2 ? ET.one : ET.two;
//                             ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
