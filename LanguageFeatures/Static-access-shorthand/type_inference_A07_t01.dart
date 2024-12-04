// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Expressions of the forms `.new<typeArgs>(args)` or
/// `.new<typeArgs>` (as a prefix of a `<staticMemberShorthand> <selector>*`
/// production, or the entire chain) are compile-time errors, just like the
/// corresponding `T.new<typeArgs>(args)` and `T.new<typeArgs>` already are,
/// whether used as instantiated tear-off or invoked.
///
/// @description Checks that it is a compile-time error to use a shorthand
/// expression of the form `.new<typeArgs>(args)` or `.new<typeArgs>`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

class C1<T> {
  C1();
}

class C2<T> {
  C2();
  factory C2.f() = .new<T>;
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1<T>(T v) {}

extension type ET2<T>(T v) {
  factory ET2.f() = .new<T>;
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  C1<int> c1 = .new<int>();
//                 ^
// [analyzer] unspecified
// [cfe] unspecified

  ET1<int> et1 = .new<int>(0);
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
}
