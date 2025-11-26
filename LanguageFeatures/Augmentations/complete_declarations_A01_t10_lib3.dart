// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if an augmentation is complete and any
/// declaration before it in the augmentation chain is also complete.
///
/// @description Checks that it is a compile-time error if augmentation adds a
/// body to an already completed declaration. Test declarations in different
/// part files.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

part of 'complete_declarations_A01_t10.dart';

augment class C {
  augment C() {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.id() {}
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment ET.new(int id) {}
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.foo(this.id) {}
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
}
