// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, enum, extension type, mixin, or mixin class augmentation
/// may specify `extends`, `implements` and `with` clauses (when otherwise
/// supported). The types in these clauses are appended to the introductory
/// declarations' clauses of the same kind, and if that clause did not exist
/// previously, then it is added with the new types.
///
/// @description Checks that it is a compile-time error if a class augmentation
/// specifies an interface in an `implements` clause that is not compatible
/// with the superclass.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

abstract interface class I<T> {
  T foo(T t);
}

class A<T> {
  T foo(T t) => t;
}

class C extends A<String> {}

augment class C implements I<num> {}
//                         ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C);
}
