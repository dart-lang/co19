// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a class, mixin class, enum, or
/// extension type has a primary constructor whose name is also the name of a
/// constructor declared in the body, or if it declares a primary constructor
/// whose name is `C.n`, and the body declares a static member whose basename is
/// `n`.
///
/// @description Check that it is a compile-time error if an enum has a primary
/// constructor whose name is `C.n`, and the body declares a static member whose
/// basename is `n`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

enum E1.someName(int _) {
//      ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e0.someName(1);
  static int someName = 0;
}

enum E2.someName(int _) {
//      ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e0.someName(2);
  static int get someName => 0;
}

enum E3._someName(int _) {
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e0._someName(3);
  static void _someName(int _) {}
}

enum E4.someName(int _) {
//      ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e4.someName(4);
  static void set someName(int _) {}
}

main() {
  print(E1);
  print(E2);
  print(E3);
  print(E4);
}
