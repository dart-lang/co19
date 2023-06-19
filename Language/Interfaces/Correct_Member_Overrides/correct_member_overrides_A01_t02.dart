// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let m and m′ be member signatures with the same name id. Then m
/// is a correct override of m′ iff the following criteria are all satisfied:
/// • m and m′ are both methods, both getters, or both setters.
///
/// @description Checks that it is a compile-time error if `m` and `m′` are not
/// both getters or methods
/// @author sgrekhov22@gmail.com
/// @issue 52620

interface class I1 {
  int get m => 42;
}

interface class I2 {
  int m() => 42;
}

class C1 implements I1, I2 {
  int m() => 42;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 implements I1, I2 {
  int get m => 42;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M1 implements I1, I2 {
  int m() => 0;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M2 implements I1, I2 {
  int get m => 2;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(M1);
  print(M2);
}
