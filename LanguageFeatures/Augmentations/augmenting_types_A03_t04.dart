// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - An augmenting class declaration has an `extends` clause and any prior
///   declaration for the same class also has an `extends` clause.
///
/// @description Checks that it is a compile-time error if an augmentation adds
/// `extends` clause to `mixin class` declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

mixin class C1 {}
mixin class C2 {}

class A {}

augment mixin class C1 extends Object {}
//                     ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C2 extends A {}
//               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C1);
  print(C2);
}
