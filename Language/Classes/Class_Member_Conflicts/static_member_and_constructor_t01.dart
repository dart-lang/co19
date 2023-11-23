// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let C be a class. It is a compile-time error if C declares a
/// constructor named C.n and a static member with basename n.
/// @description Check that it is a compile-time error if C declares a
/// constructor named C.n and a static member with basename n
/// @author sgrekhov@unipro.ru
/// @issue 46814

class C {
  C.s1() {}
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  static set s1(var value) {}
//           ^
// [cfe] unspecified

  C.s2() {}
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  static void s2() {}
//            ^
// [cfe] unspecified

  C.s3() {}
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  static int s3() => 1;
//           ^
// [cfe] unspecified

  C.s4() {}
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  static int get s4 => 1;
//           ^
// [cfe] unspecified

  C.s5() {}
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  static int s5 = 1;
//           ^
// [cfe] unspecified
}

main() {
  new C.s1();
  new C.s2();
  new C.s3();
  new C.s4();
  new C.s5();
}
