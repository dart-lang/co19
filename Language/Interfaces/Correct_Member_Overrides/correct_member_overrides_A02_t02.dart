// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let m and m′ be member signatures with the same name id. Then m
/// is a correct override of m′ iff the following criteria are all satisfied:
/// ...
/// • If m and m′ are both getters: The return type of m must be a subtype of
/// the return type of m′
///
/// @description Checks that it is a compile-time error if `m` and `m′` are both
/// getters and the return type of `m` is not a subtype of the return type of
/// `m′`
/// @author sgrekhov22@gmail.com

interface class I1 {
  int get m => 1;
}

interface class I2 {
  num get m => 2;
}

class C1 implements I1, I2 {
  num get m => 3;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 implements I1, I2 {
  Object get m => "C2";
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M1 implements I1, I2 {
  num get m => 4;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M2 implements I1, I2 {
  Object get m => "M2";
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(M1);
  print(M2);
}
