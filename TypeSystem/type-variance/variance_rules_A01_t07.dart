// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a variance modifier is specified
/// for a type parameter declared in the type parameter list of a declaration
/// of an extension, a generic function or method, or a type alias; or in the
/// type parameter list of a generic function type.
///
/// @description Check that it is a compile-time error if a variance modifier is
/// specified for a type parameter declared by a local generic function.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=variance

main() {
  void f1<in T>(T t) {}
//        ^^
// [analyzer] unspecified
// [cfe] unspecified

  T f2<out T>(T t) => t;
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified

  void f3<inout T>(T t) {}
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void f4<X, in Y>(X x, Y y) {}
//           ^^
// [analyzer] unspecified
// [cfe] unspecified

  print(f1);
  print(f2);
  print(f3);
  print(f4);
}
