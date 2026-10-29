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
/// @description Checks that it is a compile-time error if the type arguments of
/// the redirection target of a redirecting factory constructor declared in an
/// extension don't satisfy the bounds of the corresponding type parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C<T> {}

class D<T extends num> extends C<T> {}

mixin M<T> {}

class MO<T extends num> with M<T> {}

mixin class MC<T> {}

class MC1<T extends num> extends MC<T> {}

extension type ET<T>(int _) {}

extension type ET1<T extends num>(int _) implements ET<T> {}

class I<T> {}

enum E<T extends num> implements I<T> {
  e0<Never>();

  const E();
  factory E.f() => e0;
}

extension ExtC<T> on C<T> {
  factory foo() = D<T>.new;
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtM<T> on M<T> {
  factory foo() = MO<T>.new;
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtMC<T> on MC<T> {
  factory foo() = MC1<T>.new;
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtET<T> on ET<T> {
  factory foo(int v) = ET1<T>.new;
//                         ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtI<T> on I<T> {
  factory foo() = E<T>.f;
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
  print(MC);
  print(ET);
  print(I);
  print(E);
}
