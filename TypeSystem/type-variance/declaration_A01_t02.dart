// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a variance modifier is specified
/// for a type parameter declared by a static extension, a generic function
/// type, a generic function or method, or a type alias.
///
/// @description Check that it is a compile-time error if a variance modifier is
/// specified for a type parameter declared by a generic function type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=variance

typedef F1<in T>();
//         ^^
// [analyzer] unspecified
// [cfe] unspecified

typedef F2<out T>();
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef F3<inout T>();
//         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef F4<in T> = void Function(T);
//         ^^
// [analyzer] unspecified
// [cfe] unspecified

typedef F5<out T> = void Function(T);
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef F6<inout T> = void Function(T);
//         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(F1);
  print(F2);
  print(F3);
  print(F4);
  print(F5);
  print(F6);
}
