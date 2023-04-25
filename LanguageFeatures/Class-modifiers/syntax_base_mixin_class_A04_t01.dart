// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Base mixin class can be constructed, extended and mixed in but
/// not implemented and is not exhaustive
///
/// @description Checks that a `base mixin` on a `base mixin class` can be
/// declared (other cases are tested in `basic_restrictions_A04_t*`)
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

base mixin class LocalBaseMixinClass {}

base mixin BaseMixinOnBaseMixinClass on BaseMixinClass {}

base mixin BaseMixinOnLocalBaseMixinClass on LocalBaseMixinClass {}

main() {
  print(BaseMixinOnBaseMixinClass);
  print(BaseMixinOnLocalBaseMixinClass);
}
