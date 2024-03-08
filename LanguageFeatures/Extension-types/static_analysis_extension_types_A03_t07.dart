// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All name conflicts specified in the language specification
/// section 'Class Member Conflicts' occur as well in an extension type
/// declaration.
///
/// @description Checks that it is a compile-time error if an extension type
/// declares an instance member whose name conflicts with the representation
/// variable
/// @author sgrekhov22@gmail.com

extension type ET1(int id) {
  int get id => 42;
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2(int id) {
  void id() {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET3(int id) {
  void id<T>(String arg, T t) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET1);
  print(ET2);
  print(ET3);
}
