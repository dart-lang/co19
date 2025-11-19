// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a class, mixin class, enum, or
/// extension type has a primary constructor whose name is also the name of a
/// constructor declared in the body, or if it declares a primary constructor
/// whose name is `C.n`, and the body declares a static member whose basename is
/// `n`.
///
/// @description Check that it is a compile-time error if a mixin class has a
/// primary constructor whose name is `C.n`, and the body declares a static
/// member whose basename is `n`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

mixin class C1.someName() {
  static int someName = 0;
//           ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class C2.someName() {
  static int get someName => 0;
//               ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class C3._someName() {
  static void _someName() {}
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class C4.someName() {
  static void set someName(int _) {}
//                ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
}
