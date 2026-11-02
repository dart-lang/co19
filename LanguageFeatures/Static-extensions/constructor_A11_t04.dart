// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If this invocation does not include actual type arguments and
/// the extension declares one or more type parameters then the invocation is
/// subject to type inference to reconstruct the type arguments.
///
/// @description Checks that it is a compile-time error if an invocation of the
/// form `E.name(arguments)` does not include actual type arguments and the
/// type arguments inferred from the context type are not compatible with the
/// actual arguments or with the declared bounds of the type parameters of the
/// extension.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C<X> {}

mixin M<X> {}

class MO<X> with M<X> {}

mixin class MC<X> {}

enum E<X> {
  e0<Never>();
}

extension type ET<X>(int id) {}

extension ExtC1<T> on C<T> {
  factory fromValue(T v) => C<T>();
}

extension ExtC2<T extends num> on C<T> {
  factory named() => C<T>();
  factory fromValue(T v) => C<T>();
}

extension ExtM1<T> on M<T> {
  factory fromValue(T v) => MO<T>();
}

extension ExtM2<T extends num> on M<T> {
  factory named() => MO<T>();
  factory fromValue(T v) => MO<T>();
}

extension ExtMC1<T> on MC<T> {
  factory fromValue(T v) => MC<T>();
}

extension ExtMC2<T extends num> on MC<T> {
  factory named() => MC<T>();
  factory fromValue(T v) => MC<T>();
}

extension ExtE1<T> on E<T> {
  factory fromValue(T v) => E.e0;
}

extension ExtE2<T extends num> on E<T> {
  factory named() => E.e0;
  factory fromValue(T v) => E.e0;
}

extension ExtET1<T> on ET<T> {
  factory fromValue(T v) => ET<T>(0);
}

extension ExtET2<T extends num> on ET<T> {
  factory named() => ET<T>(0);
  factory fromValue(T v) => ET<T>(0);
}

main() {
  C<String> _ = ExtC1.fromValue(1);
//                              ^
// [analyzer] unspecified
// [cfe] unspecified

  C<String> _ = ExtC2.named();
//              ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtC2.fromValue("s");
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<String> _ = ExtM1.fromValue(1);
//                              ^
// [analyzer] unspecified
// [cfe] unspecified

  M<String> _ = ExtM2.named();
//              ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtM2.fromValue("s");
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<String> _ = ExtMC1.fromValue(1);
//                                ^
// [analyzer] unspecified
// [cfe] unspecified

  MC<String> _ = ExtMC2.named();
//               ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtMC2.fromValue("s");
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  E<String> _ = ExtE1.fromValue(1);
//                              ^
// [analyzer] unspecified
// [cfe] unspecified

  E<String> _ = ExtE2.named();
//              ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtE2.fromValue("s");
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<String> _ = ExtET1.fromValue(1);
//                                ^
// [analyzer] unspecified
// [cfe] unspecified

  ET<String> _ = ExtET2.named();
//               ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtET2.fromValue("s");
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
