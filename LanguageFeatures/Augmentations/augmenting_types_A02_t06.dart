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
/// an `abstract class`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

part 'augmenting_types_A02_t06_lib.dart';

abstract class C1 {}

abstract class C2 {}

abstract class C3 {}

abstract class C4 {}

abstract class C5 {}

abstract class C6 {}

abstract class C7 {}

abstract class C8 {}

abstract class C9 {}

abstract class C10 {}

abstract class C11 {}

abstract class C12 {}

abstract class C13 {}

abstract class C14 {}

abstract class C15 {}

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
