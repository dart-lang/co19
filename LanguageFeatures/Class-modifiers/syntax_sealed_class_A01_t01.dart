// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Sealed class cannot be constructed, extended, implemented or
/// mixed in but is exhaustive
///
/// @description Checks that `sealed class` cannot be constructed
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

sealed class LocalSealedClass {}

main() {
  SealedClass();
//^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  LocalSealedClass();
//^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
