// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a redirecting factory constructor
/// declared in an extension has a redirection target which is not a subtype of
/// the un-instantiated on-type of the extension (after inference has been
/// performed).
///
/// In addition, all of the usual compile-time errors associated with
/// declarations of redirecting factory constructors continue to apply.
///
/// @description Checks that it is a compile-time error if a redirecting factory
/// constructor declared in an extension redirects to a constructor that does
/// not exist or to a declaration that is not a constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C<T> {
  C();
  static C<Never> s() => C<Never>();
}

mixin M<T> {}

class MO<T> with M<T> {
  MO();
  static MO<Never> s() => MO<Never>();
}

mixin class MC<T> {
  static MC<Never> s() => MC<Never>();
}

extension type ET<T>(int _) {
  static ET<Never> s() => ET<Never>(0);
}

enum E<T> {
  e0<Never>();

  static E<Never> s() => e0;
}

extension ExtC<T> on C<T> {
  factory foo1() = C<T>.nonExisting;
//                 ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2() = C.s;
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtM<T> on M<T> {
  factory foo1() = MO<T>.nonExisting;
//                 ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2() = MO.s;
//                 ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtMC<T> on MC<T> {
  factory foo1() = MC<T>.nonExisting;
//                 ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2() = MC.s;
//                 ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtET<T> on ET<T> {
  factory foo1() = ET<T>.nonExisting;
//                 ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2() = ET.s;
//                 ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtE<T> on E<T> {
  factory foo1() = E<T>.nonExisting;
//                 ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2() = E.s;
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
  print(MC);
  print(ET);
  print(E);
}
