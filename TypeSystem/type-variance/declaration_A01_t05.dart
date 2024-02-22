// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a variance modifier is specified
/// for a type parameter declared by a static extension, a generic function
/// type, a generic function or method, or a type alias.
///
/// @description Check that it is a compile-time error if a variance modifier is
/// specified for a type parameter declared by an enum
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=variance

enum  E1<in T> {e;}
//       ^^
// [analyzer] unspecified
// [cfe] unspecified

enum  E2<out T> {e;}
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

enum  E3<inout T> {e;}
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(E1);
  print(E2);
  print(E3);
}
