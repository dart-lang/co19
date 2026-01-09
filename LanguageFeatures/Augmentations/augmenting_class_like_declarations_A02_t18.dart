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
/// compatible with existing members.
/// @author sgrekhov22@gmail.com
/// @issue 55448

// SharedOptions=--enable-experiment=augmentations

interface class I {
  int foo() => 42;
}

abstract class C {
  String get foo => "C";
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment abstract class C implements I {}

mixin M {
  String get foo => "M";
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M implements I {}

enum E {
  e1;
  String get foo => "E";
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E implements I {
  ;
}

main() {
  print(C);
  print(M);
  print(E);
}
