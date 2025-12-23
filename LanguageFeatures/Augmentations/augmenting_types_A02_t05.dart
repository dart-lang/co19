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
/// a `sealed class`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

part 'augmenting_types_A02_t05_lib.dart';

sealed class C1 {}

sealed class C2 {}

sealed class C3 {}

sealed class C4 {}

sealed class C5 {}

sealed class C6 {}

sealed class C7 {}

sealed class C8 {}

sealed class C9 {}

sealed class C10 {}

sealed class C11 {}

sealed class C12 {}

sealed class C13 {}

sealed class C14 {}

sealed class C15 {}

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
