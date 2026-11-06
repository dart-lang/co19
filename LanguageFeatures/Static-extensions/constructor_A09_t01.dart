// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a factory constructor declared in
/// an extension has an inferred return type which is not a subtype of the
/// on-type of the extension (after inference has been performed).
///
/// @description Checks that it is a compile-time error if a non-redirecting
/// factory constructor declared in an extension returns a value whose type is
/// not a subtype of the un-instantiated on-type of the extension.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C<X> {}

class D<X> extends C<int> {}

class Unrelated<X> {}

mixin M<X> {}

class MO<X> = Object with M<X>;

mixin class MC<X> {}

enum E<X> {
  e0<int>(), e1<String>();
}

extension type ET<X>(int _) {}

extension ExtC<T> on C<T> {
  factory foo1() => C<int>();
//                  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2() => D<T>();
//                  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo3() => Unrelated<T>();
//                  ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo4() {
    return Object();
//         ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  factory foo5(bool b) {
    if (b) {
      return C<T>();
    }
    return C<String>();
//         ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

extension ExtM<T> on M<T> {
  factory foo1() => MO<int>();
//                  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2() {
    return MC<T>();
//         ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

extension ExtMC<T> on MC<T> {
  factory foo1() => MC<int>();
//                  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2() {
    return MO<T>();
//         ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

extension ExtE<T> on E<T> {
  factory foo1() => E.e0;
//                  ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2() {
    return E.e1;
//         ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

extension ExtET<T> on ET<T> {
  factory foo1() => ET<int>(0);
//                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2(int v) {
    return v;
//         ^
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
