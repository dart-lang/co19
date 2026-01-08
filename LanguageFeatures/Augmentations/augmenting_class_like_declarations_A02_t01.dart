// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - An augmenting class declaration has an `extends` clause and any prior
///   declaration for the same class also has an `extends` clause.
///
/// @description Checks that it is a compile-time error if an augmenting type
/// declares an extends clause, but one was already present.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class A {}
class B extends A {}
class D extends B {}
class C1 extends B {}
class C2 extends B {}
class C3 extends B {}

augment class C1 extends B {}
//               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C2 extends A {}
//               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C3 extends D {}
//               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C1);
  print(C2);
  print(C3);
}
