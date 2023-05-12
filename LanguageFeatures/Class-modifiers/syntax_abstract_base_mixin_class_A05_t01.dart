// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract base mixin class can be extended and mixed in but not
/// constructed, implemented and is not exhaustive
///
/// @description Checks that an `abstract base mixin` on a `base mixin class`
/// can be declared (other cases are tested in `basic_restrictions_A04_t*`)
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

abstract base mixin class LocalAbstractBaseMixinClass {}

base mixin BaseMixinOnAbstractBaseMixinClass on AbstractBaseMixinClass {}

base mixin BaseMixinOnLocalAbstractBaseMixinClass
    on LocalAbstractBaseMixinClass {}

main() {
  print(BaseMixinOnAbstractBaseMixinClass);
  print(BaseMixinOnLocalAbstractBaseMixinClass);
}
