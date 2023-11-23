// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Base mixin can be mixed in but not constructed, extended or
/// implemented and is not exhaustive
///
/// @description Checks that a `base mixin` on a `base mixin` can be
/// declared (other cases are tested in `basic_restrictions_A04_t*`)
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

base mixin LocalBaseMixin {}

base mixin BaseMixinOnBaseMixin on BaseMixin {}

base mixin BaseMixinOnLocalBaseMixin on LocalBaseMixin {}

main() {
  print(BaseMixinOnBaseMixin);
  print(BaseMixinOnLocalBaseMixin);
}
