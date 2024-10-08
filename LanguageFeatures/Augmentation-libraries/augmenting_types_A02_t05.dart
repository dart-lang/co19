// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - The augmenting declaration and augmented declaration do not have all the
///   same modifiers: `abstract`, `base`, `final`, `interface`, `sealed` and
///   `mixin` for `class` declarations, and `base` for `mixin` declarations.
///
/// @description Checks that it is a compile-time error if an augmenting type
/// and corresponding type do not have all the same modifiers. Test  augmenting
/// `sealed class`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmenting_types_A02_t05_lib.dart';

sealed class C {}

main() {
  print(C);
}
