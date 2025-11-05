// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider an expression `e` which is a member invocation with
/// syntactic receiver `C` and an associated member name `m`. Assume that `m` is
/// a static member declared by `D`. The static analysis and dynamic semantics
/// of this expression is the same as in Dart before the introduction of this
/// feature.
/// ...
/// In the case where `D` does not declare any static members whose basename is
/// the basename of `m`, and `D` does not declare any constructors named `C.m2`
/// where `m2` is the basename of `m`, let `M` be the set containing each
/// accessible extension whose on-declaration is `D`, and whose static members
/// include one with the name `m`, or which declares a constructor named `C.m`.
/// ...
/// An error occurs if `M` is empty, or `M` contains more than one member.
///
/// @description Checks that that it is a compile-time error to invoke `m` if
/// `M` contains more than one member. Test a setter as `m`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C {}

mixin M {}

extension type ET(int _) {}

enum E {
  e0;
}

extension ExtC1 on C {
  static void set foo(int _) {}
}

extension ExtC2 on C {
  static void set foo(int _) {}
}

extension ExtM1 on M {
  static void set foo(int _) {}
}

extension ExtM2 on M {
  static void set foo(int _) {}
}

extension ExtET1 on ET {
  static void set foo(int _) {}
}

extension ExtET2 on ET {
  static void set foo(int _) {}
}

extension ExtE1 on E {
  static void set foo(int _) {}
}

extension ExtE2 on E {
  static void set foo(int _) {}
}

main() {
  C.foo = 42;
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  M.foo = 42;
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET.foo = 42;
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified

  E.foo = 42;
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
