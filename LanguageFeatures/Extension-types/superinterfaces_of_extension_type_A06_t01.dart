// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if the body of an extension type
/// member contains `super`.
///
/// @description Checks that a compile-time error occurs if an extension type
/// member contains `super`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type ET1(int id) {}

extension type ET2(int id) implements ET1 {
  int get myHashCode => super.hashCode;
//                      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  int myId() => super.id;
//              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void set setter(int v) {
    print(super.id);
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  int operator +(int other) => super.id + other;
//                             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET2);
}
