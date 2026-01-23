// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if an augmentation doesn't have the
/// same kind as the introductory declaration. For example, augmenting a `class`
/// with a `mixin`, an `enum` with a function, a method with a getter, etc.
///
/// @description Checks that it is a compile-time error if a function augments a
/// function-type variable and vice versa.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

var f1 = () {};

augment Null f1();
//           ^^
// [analyzer] unspecified
// [cfe] unspecified

abstract int Function() f2;

augment int f2() => 42;
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

Null f3();

augment var f3 = () {};
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

int f4() => 42;

augment abstract int Function() f4;
//                              ^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(f1);
  print(f2);
  print(f3);
  print(f4);
}
