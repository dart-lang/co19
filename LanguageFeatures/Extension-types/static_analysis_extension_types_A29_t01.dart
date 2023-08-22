// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the modifier covariant occurs in
/// the declaration of a formal parameter of a function which is not an instance
/// method, an instance setter, or an operator.
///
/// @description Checks that it is a compile-time error if an extension type
/// member has a member with a covariant formal parameter
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type ET1(num id) {
  void method(covariant int i) {}
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2<T extends num>(T id) {
  void setter(covariant int x) {}
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET3(num id) {
  int operator +(covariant int other) => other + id.floor();
//               ^^^^^^^^^
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
