// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider an expression `e` which is a member invocation with
/// syntactic receiver `C` and an associated member name `m`. Assume that `m` is
/// a static member declared by `D`. The static analysis and dynamic semantics
/// of this expression is the same as in Dart before the introduction of this
/// feature.
/// ...
/// When `D` declares a static member whose basename is the basename of `m`, but
/// `D` does not declare a static member named `m` or a constructor named `C.m`,
/// a compile-time error occurs.
///
/// @description Checks that it is a compile-time error if `D` declares a static
/// member whose basename is the basename of `m`, but `D` does not declare a
/// member named `m`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C {
  static final int foo = 42;
}

mixin M {
  static int foo() => 42;
}

extension type ET(int _) {
  static int get foo => 42;
}

enum E {
  e0;
  static int foo() => 42;
}

extension ExtC on C {
  static void set foo(int _) {}
}

extension ExtM on M {
  static void set foo(int _) {}
}

extension ExtET on ET {
  static void set foo(int _) {}
}

extension ExtE on E {
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
