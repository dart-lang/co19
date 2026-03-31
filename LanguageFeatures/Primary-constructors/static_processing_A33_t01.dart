// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a mixin class declaration has a
/// primary constructor which is not trivial, that is, it declares one or more
/// parameters, or it has a body part that has an initializer list or a body.
///
/// @description Check that it is a compile-time error if a mixin class
/// declaration has a primary constructor which declares parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

mixin class M1(int x) {}
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class M2([int x = 0]);
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class M3({int x = 0}) {}
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class M4({required int x});
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(M1);
  print(M2);
  print(M3);
  print(M4);
}
