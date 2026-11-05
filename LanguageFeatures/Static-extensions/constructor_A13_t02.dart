// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `M` be the set of accessible extensions with on-declaration
/// `D` that declare a constructor with uniform base constructor name `name` or
/// a static member with basename `name`.
/// ...
/// Otherwise, if `M` only includes static members then this is not an
/// instance creation expression, it is a static member invocation or reference
/// and it is specified in an earlier section.
///
/// @description Checks that if `M` only includes static members, then an
/// expression of the form `C<TypeArguments>.name(arguments)`,
/// `C<TypeArguments>.name` or `new C.name(arguments)` is a compile-time error,
/// because it is not an instance creation expression, and a static member
/// cannot be accessed through a parameterized type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C<X> {}

mixin M<X> {}

mixin class MC<X> {}

enum E<X> {
  e0<Never>();
}

extension type ET<X>(int _) {}

extension ExtC<T> on C<T> {
  static String foo() => "ExtC.foo";
  static String get getter => "ExtC.getter";
  static set setter(String _) {}
  static String variable = "ExtC.variable";
}

extension ExtM<T> on M<T> {
  static String foo() => "ExtM.foo";
  static String get getter => "ExtM.getter";
  static set setter(String _) {}
  static String variable = "ExtM.variable";
}

extension ExtMC<T> on MC<T> {
  static String foo() => "ExtMC.foo";
  static String get getter => "ExtMC.getter";
  static set setter(String _) {}
  static String variable = "ExtMC.variable";
}

extension ExtE<T> on E<T> {
  static String foo() => "ExtE.foo";
  static String get getter => "ExtE.getter";
  static set setter(String _) {}
  static String variable = "ExtE.variable";
}

extension ExtET<T> on ET<T> {
  static String foo() => "ExtET.foo";
  static String get getter => "ExtET.getter";
  static set setter(String _) {}
  static String variable = "ExtET.variable";
}

main() {
  C<int>.foo();
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

  C<int>.foo;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

  C<int>.getter;
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C<int>.setter = "";
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C<int>.variable;
//       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  new C.foo();
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<int>.foo();
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<int>.foo;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<int>.getter;
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<int>.setter = "";
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<int>.variable;
//       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  new M.foo();
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<int>.foo();
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<int>.foo;
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<int>.getter;
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<int>.setter = "";
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<int>.variable;
//        ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  new MC.foo();
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

  E<int>.foo();
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

  E<int>.foo;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

  E<int>.getter;
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  E<int>.setter = "";
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  E<int>.variable;
//       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  new E.foo();
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<int>.foo();
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<int>.foo;
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<int>.getter;
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<int>.setter = "";
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<int>.variable;
//        ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  new ET.foo();
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
