// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if the body of an extension type
/// member contains `super`.
///
/// @description Checks that a compile-time error occurs if an extension type
/// member contains `super`
/// @author sgrekhov22@gmail.com

extension type ET1(int id) {}

extension type ET2(int id) implements ET1 {
   void Function() get foo => () {print(super.toString());};
//                                      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void Function() myId() {
    return () {
      print(super.toString());
//          ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }

  void set setter(int v) {
    var f = () {
      print(super.id);
//          ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }

  int operator +(int other) {
    var f = () {
      print(super.id);
//          ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    return id + other;
  }
}

main() {
  print(ET2);
}
