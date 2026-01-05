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
/// a `base mixin class`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part 'augmenting_types_A02_t11_lib.dart';

base mixin class C1 {}

base mixin class C2 {}

base mixin class C3 {}

base mixin class C4 {}

base mixin class C5 {}

base mixin class C6 {}

base mixin class C7 {}

base mixin class C8 {}

base mixin class C9 {}

base mixin class C10 {}

base mixin class C11 {}

base mixin class C12 {}

base mixin class C13 {}

base mixin class C14 {}

base mixin class C15 {}

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
