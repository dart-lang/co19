// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, enum, extension type, mixin, or mixin class augmentation
/// may specify `extends`, `implements` and `with` clauses (when otherwise
/// supported). The types in these clauses are appended to the introductory
/// declarations' clauses of the same kind, and if that clause did not exist
/// previously, then it is added with the new types.
///
/// @description Checks that it is a compile-time error if an augmentation adds
/// a superclass in an `extends` statement that is incompatible with the
/// existing class members.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

abstract class A {
  int foo();
}

class C1 {
  String get foo => "C1";
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract class C2 {
  void set foo(String _);
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment class C1 extends A {}

augment abstract class C2 extends A {}

main() {
  print(C1);
  print(C2);
}
