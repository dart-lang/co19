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
/// `m′`. Test `extends` and `on` clauses
/// @author sgrekhov22@gmail.com

mixin class I {
  int get m => 42;
}

class C extends I {
  num get m => 3.14;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M on I {
  num get m => 3.14;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
}
