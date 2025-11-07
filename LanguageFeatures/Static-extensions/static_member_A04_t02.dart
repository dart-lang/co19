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
  static void set foo(int _) {}
}

mixin M {
  static void set foo(int _) {}
}

extension type ET(int _) {
  static void set foo(int _) {}
}

enum E {
  e0;
  static void set foo(int _) {}
}

extension ExtC on C {
  static final int foo = 42;
}

extension ExtM on M {
  static int foo() => 42;
}

extension ExtET on ET {
  static int get foo => 42;
}

extension ExtE on E {
  static int get foo => 42;
}

main() {
  C.foo;
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
  M.foo();
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
  ET.foo;
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified
  E.foo;
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
