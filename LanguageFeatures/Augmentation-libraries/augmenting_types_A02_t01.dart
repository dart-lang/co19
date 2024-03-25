// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The augmenting type and corresponding type do not have all the same
///   modifiers (final, sealed, mixin, etc).
///
/// @description Checks that it is a compile-time error if an augmenting type
/// and corresponding type do not have all the same modifiers (final, sealed,
/// mixin, etc). Test `class` in the main library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_types_A02_t01_lib.dart';

class C {}

main() {
  print(C);
}
