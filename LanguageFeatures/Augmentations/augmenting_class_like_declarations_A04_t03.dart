// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - An augmenting class declaration has an `extends` clause and any prior
///   declaration for the same class also has an `extends` clause.
///
/// @description Checks that it is a compile-time error if an augmenting type
/// declares an extends clause, but one was already present. Test
/// `extends Object` case
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

typedef ObjectAlias = Object;

class C1 extends Object {}
class C2 extends Object {}
class C3 extends ObjectAlias {}
class C4 extends ObjectAlias {}

augment class C1 extends Object {}
//               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C2 extends ObjectAlias {}
//               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C3 extends Object {}
//               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C4 extends ObjectAlias {}
//               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
}
