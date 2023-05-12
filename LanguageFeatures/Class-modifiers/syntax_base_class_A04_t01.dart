// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Base class can be constructed and extended but not implemented,
/// mixed in and is not exhaustive
///
/// @description Checks that a `base mixin` can be declared on a `base class`
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

base class LocalBaseClass {}

base mixin BaseMixinOnBaseClass on BaseClass {}

base mixin BaseMixinOnLocalBaseClass on LocalBaseClass {}

main() {
  print(BaseMixinOnBaseClass);
  print(BaseMixinOnLocalBaseClass);
}
