// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, enum, extension type, mixin, or mixin class augmentation
/// may specify `extends`, `implements` and `with` clauses (when otherwise
/// supported). The types in these clauses are appended to the introductory
/// declarations' clauses of the same kind, and if that clause did not exist
/// previously, then it is added with the new types.
///
/// @description Checks that it is a compile-time error if augment of a class or
/// enum specifies a `with` clause which is incompatible with existing
/// interfaces.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

abstract class A {
  String foo();
}

mixin M {
  int get foo => 42;
}

abstract class C extends A {}
//             ^
// [analyzer] unspecified
// [cfe] unspecified

augment abstract class C with M {}

main() {
  print(C);
}
