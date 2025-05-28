// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All name conflicts specified in the language specification
/// section 'Class Member Conflicts' occur as well in an extension type
/// declaration.
///
/// @description Checks that it is a compile-time error if an extension type `V`
/// declares a static member with basename `n` and the interface of `V` has an
/// instance member with basename `n`.
/// @author sgrekhov22@gmail.com

extension type ET1(int id) {
  static int get n => 1;
//               ^
// [analyzer] unspecified
  int get n => 1;
//        ^
// [cfe] unspecified
}

extension type ET2(int id) {
  static int n() => 2;
//           ^
// [analyzer] unspecified
  void set n(int v) {}
//         ^
// [cfe] unspecified
}

extension type ET3(int id) {
  static void set n(int x) {}
//                ^
// [analyzer] unspecified
  int n() => 3;
//    ^
// [cfe] unspecified
}

extension type ET4(int id) {
  static int n = 4;
//           ^
// [analyzer] unspecified
  int n() => 4;
//    ^
// [cfe] unspecified
}

extension type ET5(int id) {
  static int get id => 5;
//               ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET6(int id) {
  static String id = "6";
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET7(int id) {
  static void id() {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET8(int id) {
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified
  static void set id(int v) {}
//                ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
  print(ET5);
  print(ET6);
  print(ET7);
  print(ET8);
}
