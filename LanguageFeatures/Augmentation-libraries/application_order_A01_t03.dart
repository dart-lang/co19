// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Augmentations are applied in least to greatest order using the
/// after relation.
///
/// @description Checks that it is a compile-time error if an augmentation
/// declaration is applied before the introductory declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part 'application_order_A01_t03_lib1.dart';
part 'application_order_A01_t03_lib3.dart';

augment class A {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(A);
  print(B);
  print(C);
}
