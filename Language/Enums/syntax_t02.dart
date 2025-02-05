// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An enumerated type, or enum, is used to represent a fixed number
/// of constant values.
///  enumType:
///  metadata enum id ‘{’ id [‘, ’ id]* [‘, ’] ‘}’
///  ;
///
/// @description Checks that it is compile-time error if enum does not declare
/// any member.
/// @author sgrekhov@unipro.ru

enum E1 {}
//   ^^
// [analyzer] unspecified
// [cfe] unspecified

enum E2 {
//   ^^
// [analyzer] unspecified
// [cfe] unspecified
  ;
}

main() {
  print(E1);
  print(E2);
}
