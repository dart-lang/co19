// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let C be a class. ... It is a compile-time error if C declares a
/// static member with basename n and the interface of C has an instance member
/// with basename n
///
/// @description Check that it is a compile-time error if C declares a static
/// member with basename n and an instance member with basename n. Test instance
/// getter
/// @author sgrekhov@unipro.ru

class C {
  int get s1 => 1;
  int get s2 => 1;
  int get s3 => 1;
  int get s4 => 1;
  int get s5 => 1;
  int get _s1 => 2;
  int get _s2 => 2;
  int get _s3 => 2;
  int get _s4 => 2;
  int get _s5 => 2;

  static set s1(var value) {}
//           ^^
// [analyzer] unspecified
// [cfe] unspecified

  static void s2() {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

  static int s3() => 1;
//           ^^
// [analyzer] unspecified
// [cfe] unspecified

  static int get s4 => 1;
//               ^^
// [analyzer] unspecified
// [cfe] unspecified

  static int s5 = 1;
//           ^^
// [analyzer] unspecified
// [cfe] unspecified

  static set _s1(var value) {}
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void _s2() {}
//            ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static int _s3() => 1;
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static int get _s4 => 1;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static int _s5 = 1;
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new C();
}
