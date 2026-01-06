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
/// enum augment specifies `implements` clause but doesn't implement this
/// interface.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

interface class I {
  String get id => "I";
}

class C {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

augment class C implements I {}

mixin M {}

augment mixin M implements I {}

enum E {
//   ^
// [analyzer] unspecified
// [cfe] unspecified
  e1;
}

augment enum E implements I {
  ;
}

class MA = Object with M;
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C);
  print(MA);
  print(E);
}
