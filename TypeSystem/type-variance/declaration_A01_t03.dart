// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a variance modifier is specified
/// for a type parameter declared by a static extension, a generic function
/// type, a generic function or method, or a type alias.
///
/// @description Check that it is a compile-time error if a variance modifier is
/// specified for a type parameter declared by a generic function
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=variance

void f1<in T>(T t) {}
//      ^^
// [analyzer] unspecified
// [cfe] unspecified

void f2<out T>(T t) {}
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified

void f3<inout T>(T t) {}
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(f1);
  print(f2);
  print(f3);
}
