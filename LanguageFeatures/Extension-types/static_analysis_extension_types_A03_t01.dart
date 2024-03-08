// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All name conflicts specified in the language specification
/// section 'Class Member Conflicts' occur as well in an extension type
/// declaration.
///
/// @description Checks that it is a compile-time error if an extension type
/// declares a constructor named `n` and has a static member with basename `n`.
/// @author sgrekhov22@gmail.com

extension type ET1(int id) {
  static int get n => 1;
//               ^
// [cfe] unspecified
  ET1.n(this.id);
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2(int id) {
  static int n() => 2;
//           ^
// [cfe] unspecified
  const ET2.n(this.id);
//          ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET3(int id) {
  static int n() => 3;
//           ^
// [cfe] unspecified
  factory ET3.n(int id) = ET3.new;
//            ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET4(int id) {
  static int n = 1;
//           ^
// [cfe] unspecified
  ET4.n(this.id);
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
}
