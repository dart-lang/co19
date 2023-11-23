// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a member declaration in an
/// extension type declaration is abstract.
///
/// @description Checks that it is a compile-time error if an extension type
/// declares an abstract member.
/// @author sgrekhov22@gmail.com
/// @issue 53320

// SharedOptions=--enable-experiment=inline-class

extension type ET1(int id) {
  abstract int m;
//^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2<T>(T id) {
  T get getter;
//^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET3(int id) {
  void setter(int x);
//^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET4<T>(T id) {
  void method();
//^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET5(int id) {
  int operator +(int other);
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
  print(ET5);
}
