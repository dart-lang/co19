// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `M` be the set of accessible extensions with on-declaration
/// `D` that declare a constructor with uniform base constructor name `name` or
/// a static member with basename `name`.
///
/// A compile-time error occurs if `M` includes extensions with constructors as
/// well as static members.
///
/// @description Checks that it is a compile-time error if an instance creation
/// expression of the form `C<TypeArguments>.name(arguments)` (where
/// `<TypeArguments>` may be absent) refers to `name`, and there are accessible
/// extensions with on-declaration `C` such that one of them declares a
/// constructor named `name` and another one declares a static member with the
/// basename `name`. Test static methods, getters, setters and variables.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C<X> {}

mixin M<X> {}

class MO<X> with M<X> {}

mixin class MC<X> {}

enum E<X> {
  e0<Never>();
}

extension type ET<X>(int _) {}

extension ExtC1<T> on C<T> {
  factory method() => C<T>();
  factory getter() => C<T>();
  factory setter() => C<T>();
  factory variable() => C<T>();
}

extension ExtC2 on C {
  static void method() {}
  static int get getter => 0;
  static set setter(int _) {}
  static int variable = 0;
}

extension ExtM1<T> on M<T> {
  factory method() => MO<T>();
  factory getter() => MO<T>();
  factory setter() => MO<T>();
  factory variable() => MO<T>();
}

extension ExtM2 on M {
  static void method() {}
  static int get getter => 0;
  static set setter(int _) {}
  static int variable = 0;
}

extension ExtMC1<T> on MC<T> {
  factory method() => MC<T>();
  factory getter() => MC<T>();
  factory setter() => MC<T>();
  factory variable() => MC<T>();
}

extension ExtMC2 on MC {
  static void method() {}
  static int get getter => 0;
  static set setter(int _) {}
  static int variable = 0;
}

extension ExtE1<T> on E<T> {
  factory method() => E.e0;
  factory getter() => E.e0;
  factory setter() => E.e0;
  factory variable() => E.e0;
}

extension ExtE2 on E {
  static void method() {}
  static int get getter => 0;
  static set setter(int _) {}
  static int variable = 0;
}

extension ExtET1<T> on ET<T> {
  factory method() => ET<T>(0);
  factory getter() => ET<T>(0);
  factory setter() => ET<T>(0);
  factory variable() => ET<T>(0);
}

extension ExtET2 on ET {
  static void method() {}
  static int get getter => 0;
  static set setter(int _) {}
  static int variable = 0;
}

main() {
  C.method();
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C<int>.method();
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C.getter();
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C<int>.getter();
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C.setter();
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C<int>.setter();
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C.variable();
//  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C<int>.variable();
//       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  M.method();
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<int>.method();
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  M.getter();
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<int>.getter();
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  M.setter();
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<int>.setter();
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  M.variable();
//  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<int>.variable();
//       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC.method();
//   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<int>.method();
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC.getter();
//   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<int>.getter();
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC.setter();
//   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<int>.setter();
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC.variable();
//   ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<int>.variable();
//        ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  E.method();
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  E<int>.method();
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  E.getter();
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  E<int>.getter();
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  E.setter();
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  E<int>.setter();
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  E.variable();
//  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  E<int>.variable();
//       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET.method();
//   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<int>.method();
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET.getter();
//   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<int>.getter();
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET.setter();
//   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<int>.setter();
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET.variable();
//   ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<int>.variable();
//        ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
