// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let C be a class. It is a compile-time error if C declares a
/// constructor named C.n and a static member with basename n.
/// @description Check that it is a compile-time error if C declares a
/// constructor named C.n and a static member with basename n. Test instance
/// getter
/// @author sgrekhov@unipro.ru

class C {
  int get s => 1;
  int get _s => 2;

  static set s(var value) {}
//           ^
// [analyzer] unspecified
// [cfe] unspecified

  static void s() {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified

  static int s() => 1;
//           ^
// [analyzer] unspecified
// [cfe] unspecified

  static int get s => 1;
//               ^
// [analyzer] unspecified
// [cfe] unspecified

  static int s = 1;
//           ^
// [analyzer] unspecified
// [cfe] unspecified

  static set _s(var value) {}
//           ^^
// [analyzer] unspecified
// [cfe] unspecified

  static void _s() {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

  static int _s() => 1;
//           ^^
// [analyzer] unspecified
// [cfe] unspecified

  static int get _s => 1;
//               ^^
// [analyzer] unspecified
// [cfe] unspecified

  static int _s = 1;
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new C();
}
