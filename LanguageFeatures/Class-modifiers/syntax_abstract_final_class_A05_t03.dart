// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract final class cannot be constructed, extended, implemented
/// or mixed in and is not exhaustive
///
/// @description Checks that it is a compile-time error to declare a
/// `base mixin` on an `abstract final class` in the same library where it is
/// defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

abstract final class AbstractFinalClass {}

base mixin BaseMixinOnFinalClass on AbstractFinalClass {}

main() {
  print(BaseMixinOnFinalClass);
}
