// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let C be a class. ... It is a compile-time error if C declares a
/// static member with basename n and the interface of C has an instance member
/// with basename n
///
/// @description Check that it is a compile-time error if C declares a static
/// member with basename n and an instance member with basename n. Test instance
/// setter
/// @author sgrekhov@unipro.ru
/// @issue 46814

class C {
  set s1(int v) {}
  set s2(int v) {}
  set s3(int v) {}
  set s4(int v) {}
  set s5(int v) {}
//    ^^
// [cfe] unspecified
  set _s1(int v) {}
  set _s2(int v) {}
  set _s3(int v) {}
  set _s4(int v) {}
  set _s5(int v) {}
//    ^^^
// [cfe] unspecified

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
