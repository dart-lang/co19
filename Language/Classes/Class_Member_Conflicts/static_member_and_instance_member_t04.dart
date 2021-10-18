// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let C be a class. ... It is a compile-time error if C declares a
/// static member with basename n and the interface of C has an instance member
/// with basename n
///
/// @description Check that it is a compile-time error if C declares a static
/// member with basename n and an instance member with basename n. Test instance
/// variable
///
/// @Issue 47489
/// @author sgrekhov@unipro.ru

class C {

  // For each 's1' and '_s1', two instance variables implicitly induce a getter
  // and a setter, so there is a conflict specified in 'Class Member Conflicts'
  // as well as a regular name clash. Dart produces two compile time errors here
  // whereas analyzer reports the 'Class Member Conflicts' error, and it seems
  // reasonable to omit the plain name clashes.
  int s1 = 1;
//    ^^
// [cfe] unspecified


  int s2 = 1;
  int s3 = 1;
  int s4 = 1;
  int s5 = 1;

  int _s1 = 1;
//    ^^
// [cfe] unspecified

  int _s2 = 1;
  int _s3 = 1;
  int _s4 = 1;
  int _s5 = 1;

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
