// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a variance modifier is specified
/// for a type parameter declared in the type parameter list of a declaration
/// of an extension, a generic function or method, or a type alias; or in the
/// type parameter list of a generic function type.
///
/// @description Check that it is a compile-time error if a variance modifier is
/// specified for a type parameter declared by a type alias of a function type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=variance

typedef F1<in T> = void Function(T);
//         ^^
// [analyzer] unspecified
// [cfe] unspecified

typedef F2<out T> = T Function();
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef F3<inout T> = T Function(T);
//         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(F1);
  print(F2);
  print(F3);
}
