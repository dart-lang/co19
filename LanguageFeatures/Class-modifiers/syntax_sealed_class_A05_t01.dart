// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Sealed class cannot be constructed, extended, implemented or
/// mixed in but is exhaustive
///
/// @description Checks that it is a compile-time error if mixin is declared on
/// a `sealed class` outside of the library where it is defined
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

mixin MixinOnSealedClass on SealedClass {}
//                          ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin BaseMixinOnSealedClass on SealedClass {}
//                                   ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(MixinOnSealedClass);
  print(BaseMixinOnSealedClass);
}
