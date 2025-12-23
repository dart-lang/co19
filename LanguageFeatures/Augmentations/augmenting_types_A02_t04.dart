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
/// a `final class`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

part 'augmenting_types_A02_t04_lib.dart';

final class C1 {}

final class C2 {}

final class C3 {}

final class C4 {}

final class C5 {}

final class C6 {}

final class C7 {}

final class C8 {}

final class C9 {}

final class C10 {}

final class C11 {}

final class C12 {}

final class C13 {}

final class C14 {}

final class C15 {}

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
