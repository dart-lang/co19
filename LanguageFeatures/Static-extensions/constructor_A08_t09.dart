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
/// @description Checks that it is a compile-time error if the function type of
/// the redirection target of a redirecting factory constructor declared in an
/// extension is not a subtype of the function type of the redirecting
/// constructor. Test the case when the redirection target is an extension
/// constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C<T> {}

mixin M<T> {}

class MO<T> with M<T> {}

mixin class MC<T> {}

extension type ET<T>(int _) {}

enum E<T> {
  e0<Never>();
}

extension ExtC2<T> on C<T> {
  factory f(int v) => C<T>();
  factory opt([int v = 0]) => C<T>();
  factory named({required int v}) => C<T>();
}

extension ExtC<T> on C<T> {
  factory foo1(String v) = C<T>.f;
//                         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2() = C<T>.f;
//                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo3([int v]) = C<T>.f;
//                        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo4(int v1, int v2) = C<T>.opt;
//                               ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo5({int v}) = C<T>.named;
//                        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo6({required int x}) = C<T>.named;
//                                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtM2<T> on M<T> {
  factory f(int v) => MO<T>();
  factory opt([int v = 0]) => MO<T>();
  factory named({required int v}) => MO<T>();
}

extension ExtM<T> on M<T> {
  factory foo1(String v) = M<T>.f;
//                         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2() = M<T>.f;
//                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo3([int v]) = M<T>.f;
//                        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo4(int v1, int v2) = M<T>.opt;
//                               ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo5({int v}) = M<T>.named;
//                        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo6({required int x}) = M<T>.named;
//                                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtMC2<T> on MC<T> {
  factory f(int v) => MC<T>();
  factory opt([int v = 0]) => MC<T>();
  factory named({required int v}) => MC<T>();
}

extension ExtMC<T> on MC<T> {
  factory foo1(String v) = MC<T>.f;
//                         ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2() = MC<T>.f;
//                 ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo3([int v]) = MC<T>.f;
//                        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo4(int v1, int v2) = MC<T>.opt;
//                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo5({int v}) = MC<T>.named;
//                        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo6({required int x}) = MC<T>.named;
//                                 ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtET2<T> on ET<T> {
  factory f(int v) => ET<T>(v);
  factory opt([int v = 0]) => ET<T>(v);
  factory named({required int v}) => ET<T>(v);
}

extension ExtET<T> on ET<T> {
  factory foo1(String v) = ET<T>.f;
//                         ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2() = ET<T>.f;
//                 ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo3([int v]) = ET<T>.f;
//                        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo4(int v1, int v2) = ET<T>.opt;
//                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo5({int v}) = ET<T>.named;
//                        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo6({required int x}) = ET<T>.named;
//                                 ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtE2<T> on E<T> {
  factory f(int v) => E.e0;
  factory opt([int v = 0]) => E.e0;
  factory named({required int v}) => E.e0;
}

extension ExtE<T> on E<T> {
  factory foo1(String v) = E<T>.f;
//                         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2() = E<T>.f;
//                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo3([int v]) = E<T>.f;
//                        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo4(int v1, int v2) = E<T>.opt;
//                               ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo5({int v}) = E<T>.named;
//                        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo6({required int x}) = E<T>.named;
//                                 ^^^^^^^^^^
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
