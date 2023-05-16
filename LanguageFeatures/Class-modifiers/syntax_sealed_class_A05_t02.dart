// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Sealed class cannot be constructed, extended, implemented or
/// mixed in but is exhaustive
///
/// @description Checks that it is not an error if mixin is declared on a
/// `sealed class` in the same library where it is defined
/// @author sgrekhov22@gmail.com

sealed class SealedClass {}

mixin MixinOnSealedClass on SealedClass {}

base mixin BaseMixinOnSealedClass on SealedClass {}

main() {
  print(MixinOnSealedClass);
  print(BaseMixinOnSealedClass);
}
