// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, enum, extension type, mixin, or mixin class augmentation
/// may specify `extends`, `implements` and `with` clauses (when otherwise
/// supported). The types in these clauses are appended to the introductory
/// declarations' clauses of the same kind, and if that clause did not exist
/// previously, then it is added with the new types.
///
/// @description Checks that it is a compile-time error if a class, mixin or
/// enum augment specifies an interface in an `implements` clause which is not
/// compatible with existing interfaces.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

abstract interface class I1 {
  String foo();
}

abstract interface class I2 {
  int foo();
}

class C1 implements I1 {
  String foo() => "С1";
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment class C1 implements I2 {
  int foo() => 0;
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract class C2 implements I1 {}
//             ^^
// [analyzer] unspecified
// [cfe] unspecified

augment abstract class C2 implements I2 {}

mixin M implements I1 {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

augment mixin M implements I2 {}

enum E implements I1 {
  e1;
  String foo() => "E";
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E implements I2 {
  ;
}

main() {
  print(C1);
  print(C2);
  print(M);
  print(E);
}
