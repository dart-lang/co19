// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All name conflicts specified in the language specification
/// section 'Class Member Conflicts' occur as well in an extension type
/// declaration.
///
/// @description Checks that it is a compile-time error if an extension type `V`
/// declares a static member with basename `n` and the interface of `V` has an
/// instance setter with basename `n`.
/// @author sgrekhov22@gmail.com

extension type I(int id) {
  void set x(int _) {}
}

extension type ET1(int id) implements I {
  static int get x => 1;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2(int id) implements I {
  static int x() => 2;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET3(int id) implements I {
  static void set x(int i) {}
//                ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET4(int id) implements I {
  static int x = 4;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
}
