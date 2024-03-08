// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All name conflicts specified in the language specification
/// section 'Class Member Conflicts' occur as well in an extension type
/// declaration.
///
/// @description Checks that it is a compile-time error if the interface of
/// an extension type has an instance method named `n` and an instance setter
/// with basename `n`.
/// @author sgrekhov22@gmail.com

extension type I1(int id) {
  int n() => 1;
}

extension type I2(int id) {
  void set n(int i) {}
}

extension type ET1(int id) {
  int n() => 1;
//    ^
// [cfe] unspecified
  void set n(int i) {}
//         ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2(int id) {
  void set n(String s) {}
//         ^
// [cfe] unspecified
  int n() => 2;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET3(int id) implements I1 {
  void set n(int i) {} // no error, the setter precludes the method
}

extension type ET4(int id) implements I2 {
  int n() => 2; // no error, the method precludes the setter
}

main() {
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
}
