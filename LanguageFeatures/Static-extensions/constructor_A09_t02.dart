// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a factory constructor declared in
/// an extension has an inferred return type which is not a subtype of the
/// on-type of the extension (after inference has been performed).
///
/// @description Checks that it is a compile-time error if a non-redirecting
/// factory constructor declared in an extension returns a value whose type is
/// nullable, and the on-type of the extension is non-nullable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C<X> {}

mixin M<X> {}

class MO<X> = Object with M<X>;

mixin class MC<X> {}

enum E<X> {
  e0<int>(), e1<String>();
}

extension type ET<X>(int _) {}

C<X>? nullableC<X>() => null;

extension ExtC<T> on C<T> {
  factory foo1() => null;
//                  ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2() => nullableC<T>();
//                  ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo3(bool b) {
    return b ? C<T>() : null;
//         ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

extension ExtM<T> on M<T> {
  factory foo(M<T>? m) => m;
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtMC<T> on MC<T> {
  factory foo(MC<T>? mc) {
    return mc;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

extension ExtE<T> on E<T> {
  factory foo1(E<T>? e) => e;
//                         ^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2(bool b) {
    return b ? E.e1 as E<T> : null;
//         ^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

extension ExtET<T> on ET<T> {
  factory foo(ET<T>? et) {
    return et;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  print(C);
  print(M);
  print(MC);
  print(E);
  print(ET);
}
