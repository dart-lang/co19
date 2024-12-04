// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Non-constant shorthand:
/// ...
/// It's a compile-time error if that declaration does not have a static member
/// with base name `id`, or an unnamed constructor for `.new`.
///
/// @description Checks that it is a compile-time error if that declaration does
/// not have a static member with base name `id`, or an unnamed constructor for
/// `.new`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

class C<T> {
  C();
  C.id();
}

typedef CConstructor<T> = C<T> Function();

extension type ET<T>(T v) {
  ET.id(this.v);
}

typedef ETConstructor<T> = ET<T> Function(T t);

main() {
  CConstructor c1 = .new;
//                  ^
// [analyzer] unspecified
// [cfe] unspecified

  CConstructor<int> c2 = .id;
//                       ^
// [analyzer] unspecified
// [cfe] unspecified

  ETConstructor<int> et1 = .new;
//                         ^
// [analyzer] unspecified
// [cfe] unspecified

  ETConstructor et2 = .id;
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
}
