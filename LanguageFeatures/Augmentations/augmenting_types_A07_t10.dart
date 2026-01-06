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
/// enum augment specifies itself in an `implements` clause.
/// @author sgrekhov22@gmail.com
/// @issue 55449

// SharedOptions=--enable-experiment=augmentations

class C {}

augment class C implements C {}
//                         ^
// [analyzer] unspecified
// [cfe] unspecified

mixin M {}

augment mixin M implements M {}
//                         ^
// [analyzer] unspecified
// [cfe] unspecified

enum E {
  e1;
}

augment enum E implements E {
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
  ;
}

main() {
  print(C);
  print(M);
  print(E);
}
