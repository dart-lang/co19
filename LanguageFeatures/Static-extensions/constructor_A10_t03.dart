// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion As usual, it is an error if type arguments are passed to an
/// extension and the extension either declares no type parameters, or if the
/// number of type parameters declared does not match the number of type
/// arguments, or if the type arguments do not match the declared bounds of the
/// type parameters.
///
/// @description Checks that it is a compile-time error if the number of type
/// arguments passed to an extension does not match the number of type
/// parameters declared by the extension in an invocation of the form
/// `E<TypeArguments>.name(arguments)`.
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
  factory() => C<T>();
  factory named() => C<T>();
}

extension ExtC2<T1, T2> on C<Map<T1, T2>> {
  factory() => C<Map<T1, T2>>();
  factory named() => C<Map<T1, T2>>();
}

extension ExtM1<T> on M<T> {
  factory() => MO<T>();
  factory named() => MO<T>();
}

extension ExtM2<T1, T2> on M<Map<T1, T2>> {
  factory() => MO<Map<T1, T2>>();
  factory named() => MO<Map<T1, T2>>();
}

extension ExtMC1<T> on MC<T> {
  factory() => MC<T>();
  factory named() => MC<T>();
}

extension ExtMC2<T1, T2> on MC<Map<T1, T2>> {
  factory() => MC<Map<T1, T2>>();
  factory named() => MC<Map<T1, T2>>();
}

extension ExtE1<T> on E<T> {
  factory named() => E.e0;
}

extension ExtE2<T1, T2> on E<Map<T1, T2>> {
  factory named() => E.e0;
}

extension ExtET1<T> on ET<T> {
  factory(int v) => ET<T>(v);
  factory named(int v) => ET<T>(v);
}

extension ExtET2<T1, T2> on ET<Map<T1, T2>> {
  factory(int v) => ET<Map<T1, T2>>(v);
  factory named(int v) => ET<Map<T1, T2>>(v);
}

main() {
  ExtC1<int, String>.new();
//^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtC1<int, String>.named();
//^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtC2<int>.new();
//^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtC2<int, String, bool>.named();
//^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtM1<int, String>.new();
//^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtM1<int, String>.named();
//^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtM2<int>.new();
//^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtM2<int, String, bool>.named();
//^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtMC1<int, String>.new();
//^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtMC1<int, String>.named();
//^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtMC2<int>.new();
//^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtMC2<int, String, bool>.named();
//^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtE1<int, String>.named();
//^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtE2<int>.named();
//^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtE2<int, String, bool>.named();
//^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtET1<int, String>.new(0);
//^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtET1<int, String>.named(0);
//^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtET2<int>.new(0);
//^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ExtET2<int, String, bool>.named(0);
//^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
