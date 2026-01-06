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
/// an `abstract interface class`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part 'augmenting_types_A02_t08_lib.dart';

abstract interface class C1 {}

abstract interface class C2 {}

abstract interface class C3 {}

abstract interface class C4 {}

abstract interface class C5 {}

abstract interface class C6 {}

abstract interface class C7 {}

abstract interface class C8 {}

abstract interface class C9 {}

abstract interface class C10 {}

abstract interface class C11 {}

abstract interface class C12 {}

abstract interface class C13 {}

abstract interface class C14 {}

abstract interface class C15 {}

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
