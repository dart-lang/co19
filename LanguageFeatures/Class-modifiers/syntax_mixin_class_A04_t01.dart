// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Mixin class can be constructed, extended, implemented and mixed
/// in but is not exhaustive
///
/// @description Checks that a mixin on a `mixin class` can be declared
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

mixin class LocalMixinClass {}

mixin MixinOnMixinClass on MixinClass {}

base mixin BaseMixinOnMixinClass on MixinClass {}

mixin MixinOnLocalMixinClass on LocalMixinClass {}

base mixin BaseMixinOnLocalMixinClass on LocalMixinClass {}

main() {
  print(MixinOnMixinClass);
  print(BaseMixinOnMixinClass);
  print(MixinOnLocalMixinClass);
  print(BaseMixinOnLocalMixinClass);
}
