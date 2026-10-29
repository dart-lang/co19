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
/// constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C<T> {
  C(int v);
  C.opt([int v = 0]);
  C.named({required int v});
}

mixin M<T> {}

class MO<T> with M<T> {
  MO(int v);
  MO.opt([int v = 0]);
  MO.named({required int v});
}

mixin class MC<T> {
  MC(int v);
  MC.opt([int v = 0]);
  MC.named({required int v});
}

extension type ET<T>(int _) {
  ET.opt([int v = 0]) : this(v);
  ET.named({required int v}) : this(v);
}

enum E<T> {
  e0<Never>();

  const E();
  factory E.f(int v) => e0;
  factory E.opt([int v = 0]) => e0;
  factory E.named({required int v}) => e0;
}

extension ExtC<T> on C<T> {
  factory foo1(String v) = C<T>.new;
//                         ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2() = C<T>.new;
//                 ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo3([int v]) = C<T>.new;
//                        ^^^^^^^^
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

extension ExtM<T> on M<T> {
  factory foo1(String v) = MO<T>.new;
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2() = MO<T>.new;
//                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo3([int v]) = MO<T>.new;
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo4(int v1, int v2) = MO<T>.opt;
//                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo5({int v}) = MO<T>.named;
//                        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo6({required int x}) = MO<T>.named;
//                                 ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtMC<T> on MC<T> {
  factory foo1(String v) = MC<T>.new;
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2() = MC<T>.new;
//                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo3([int v]) = MC<T>.new;
//                        ^^^^^^^^^
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

extension ExtET<T> on ET<T> {
  factory foo1(String v) = ET<T>.new;
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2() = ET<T>.new;
//                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo3([int v]) = ET<T>.new;
//                        ^^^^^^^^^
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
