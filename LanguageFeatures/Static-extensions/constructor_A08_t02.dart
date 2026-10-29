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
/// @description Checks that it is a compile-time error if a constant
/// redirecting factory constructor declared in an extension redirects to a
/// non-constant constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C<T> {
  C();
  factory C.f() = C<T>.new;
}

mixin M<T> {}

class MO<T> with M<T> {
  MO();
}

mixin class MC<T> {
  MC();
}

extension type ET<T>(int _) {
  ET.named() : this(0);
}

enum E<T> {
  e0<Never>();

  const E();
  factory E.f() => e0;
}

extension ExtC<T> on C<T> {
  const factory foo1() = C<T>.new;
//                       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const factory foo2() = C<T>.f;
//                       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtM<T> on M<T> {
  const factory foo() = MO<T>.new;
//                      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtMC<T> on MC<T> {
  const factory foo() = MC<T>.new;
//                      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtET<T> on ET<T> {
  const factory foo() = ET<T>.named;
//                      ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtE<T> on E<T> {
  const factory foo() = E<T>.f;
//                      ^^^^^^
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
