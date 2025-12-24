// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The augmenting declaration and augmented declaration do not have all the
///   same modifiers: `abstract`, `base`, `final`, `interface`, `sealed` and
///   `mixin` for `class` declarations, and `base` for `mixin` declarations.
///
/// @description Checks that it is a compile-time error if an augmenting type
/// and the corresponding type do not have identical modifiers. Test augmenting
/// a `mixin`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part 'augmenting_types_A02_t14_lib.dart';

mixin C1 {}

mixin C2 {}

mixin C3 {}

mixin C4 {}

mixin C5 {}

mixin C6 {}

mixin C7 {}

mixin C8 {}

mixin C9 {}

mixin C10 {}

mixin C11 {}

mixin C12 {}

mixin C13 {}

mixin C14 {}

mixin C15 {}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
  print(C5);
  print(C6);
  print(C7);
  print(C8);
  print(C9);
  print(C10);
  print(C11);
  print(C12);
  print(C13);
  print(C14);
  print(C15);
}
