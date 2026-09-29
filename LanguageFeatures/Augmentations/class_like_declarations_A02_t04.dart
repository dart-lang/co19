// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if a class marked `augment` has a
/// primary constructor (`primaryConstructor`) or contains a primary constructor
/// initializer block (`primaryConstructorBodySignature`).
///
/// @description Check that it is a compile-time error if a mixin class marked
/// `augment` has a primary constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

mixin class M1();

augment mixin class M1() {}
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class M2.someName();

augment mixin class M2.someName() {}
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(M1);
  print(M2);
}
