// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, enum, extension type, mixin, or mixin class augmentation
/// may specify `extends`, `implements` and `with` clauses (when otherwise
/// supported). The types in these clauses are appended to the introductory
/// declarations' clauses of the same kind, and if that clause did not exist
/// previously, then it is added with the new types.
///
/// @description Checks that it is a compile-time error if a class or enum
/// augment specifies an interface in an `implements` clause which is not
/// compatible with existing mixins.
/// @author sgrekhov22@gmail.com
/// @issue 55448

// SharedOptions=--enable-experiment=augmentations

abstract interface class I {
  String foo();
}

mixin M {
  int foo() => 42;
}

mixin M2 {}

class C1 = Object with M;

augment class C1 implements I {
//            ^^
// [analyzer] unspecified
// [cfe] unspecified
  String foo() => "C1";
}

abstract class C2 with M {}
//             ^^
// [analyzer] unspecified
// [cfe] unspecified

augment abstract class C2 implements I {}

enum E with M {
//   ^
// [analyzer] unspecified
// [cfe] unspecified
  e1;
}

augment enum E implements I {
  ;
}

main() {
  print(C1);
  print(C2);
  print(M);
  print(E);
}
