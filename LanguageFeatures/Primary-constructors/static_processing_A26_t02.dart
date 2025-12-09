// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if an assignment to a primary
/// parameter occurs in the initializing expression of a non-late instance
/// variable, or in the initializer list of the body part of a primary
/// constructor.
///
/// @description Check that it is a compile-time error if an assignment to a
/// primary parameter occurs in the initializer list of the body part of a
/// primary constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C1(var int x) {
  this: x = 1;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2(var int x) {
  this: x++;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
}
