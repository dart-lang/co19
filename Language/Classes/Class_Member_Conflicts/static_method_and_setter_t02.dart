// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `C` be a class.
/// ...
/// It is a compile-time error if `C` declares a static method named `n` and a
/// static setter with basename `n`.
///
/// @description Check that it is a compile-time error if a class, mixin, enum,
/// extension or extension type declares a static method named `n` and a static
/// implicit setter with basename `n`.
/// @author sgrekhov22@gmail.com

class C {
  static void s() {}
  static void _s() {}

  static int s = 0;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
  static int _s = 0;
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static void s() {}
  static void _s() {}

  static int s = 0;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
  static int _s = 0;
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;

  static void s() {}
  static void _s() {}

  static int s = 0;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
  static int _s = 0;
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static void s() {}
  static void _s() {}

  static int s = 0;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
  static int _s = 0;
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  static void s() {}
  static void _s() {}

  static int s = 0;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
  static int _s = 0;
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
