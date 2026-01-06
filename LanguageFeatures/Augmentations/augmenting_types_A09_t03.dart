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
/// enum specifies not a mixin in a `with` clause.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class AugM {}

class C {}

augment class C with AugM {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified

enum E {e1;}

augment enum E with AugM {
//           ^
// [analyzer] unspecified
// [cfe] unspecified
  ;
}

main() {
  print(C);
  print(E);
}
