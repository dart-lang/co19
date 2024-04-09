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
/// @issue 53172

extension type I1(int id) {
  void x() {}
}

extension type I2(int id1) {}

extension type ET1(int id) implements I1 {
  static int get x => 1;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2(int id) implements I1 {
  static int x() => 2;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET3(int id) implements I1 {
  static void set x(int i) {}
//                ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET4(int id) implements I1 {
  static int x = 4;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET5(int id) implements I2 {
  static int id1() => 2;
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET6(int id) implements I2 {
  static int get id1 => 2;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET7(int id) implements I2 {
  static int id1 = 5;
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET8(int id) implements I2 {
  static void set id1(int id) {}
//                ^^^
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
