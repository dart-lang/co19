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
/// a superclass in an `extends` statement that is not compatible with the
/// existing interfaces.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

abstract interface class I<T> {
  T get foo;
}

abstract class A implements I<int> {}

abstract class C implements I<String> {}
//             ^
// [analyzer] unspecified
// [cfe] unspecified

augment abstract class C extends A {}

main() {
  print(C);
}
