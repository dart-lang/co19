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
/// an `abstract final class`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part 'augmenting_types_A02_t09_lib.dart';

abstract final class C1 {}

abstract final class C2 {}

abstract final class C3 {}

abstract final class C4 {}

abstract final class C5 {}

abstract final class C6 {}

abstract final class C7 {}

abstract final class C8 {}

abstract final class C9 {}

abstract final class C10 {}

abstract final class C11 {}

abstract final class C12 {}

abstract final class C13 {}

abstract final class C14 {}

abstract final class C15 {}

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
