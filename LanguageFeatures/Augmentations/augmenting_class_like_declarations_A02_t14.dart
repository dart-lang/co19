// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, enum, extension type, mixin, or mixin class augmentation
/// may specify `extends`, `implements` and `with` clauses (when otherwise
/// supported). The types in these clauses are appended to the introductory
/// declarations' clauses of the same kind, and if that clause did not exist
/// previously, then it is added with the new types.
///
/// @description Checks that it is a compile-time error if a class, mixin, enum
/// or extension type augment specifies an interface in an `implements` clause
/// which already exists.
/// @author sgrekhov22@gmail.com
/// @issue 55456

// SharedOptions=--enable-experiment=augmentations

// TODO (sgrekhov) Update this test (if needed) after
// https://github.com/dart-lang/language/issues/4542
// https://github.com/dart-lang/language/issues/4014
// https://github.com/dart-lang/language/issues/3201

abstract interface class I {
  String foo();
}

class C1 implements I {
  String foo() => "C1";
}

augment class C1 implements I {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class C2 implements I {}

augment abstract class C2 implements I {}
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified

mixin M implements I {}

augment mixin M implements I {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified

enum E implements I {
  e1;
  String foo() => "C1";
}

augment enum E implements I {
//           ^
// [analyzer] unspecified
// [cfe] unspecified
  ;
}

extension type ET(I i) implements I {}

augment extension type ET implements I {}
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified


main() {
  print(C1);
  print(C2);
  print(M);
  print(E);
  print(ET);
}
