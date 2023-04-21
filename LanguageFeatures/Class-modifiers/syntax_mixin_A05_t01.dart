// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Mixin can be implemented and mixed in but not constructed or
/// extended and is not exhaustive
///
/// @description Checks that a mixin on a `mixin` can be declared
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

mixin LocalMixin {}

mixin MixinOnMixin on Mixin {}

base mixin BaseMixinOnMixin on Mixin {}

mixin MixinOnLocalMixin on LocalMixin {}

base mixin BaseMixinOnLocalMixin on LocalMixin {}

main() {
  print(MixinOnMixin);
  print(BaseMixinOnMixin);
  print(MixinOnLocalMixin);
  print(BaseMixinOnLocalMixin);
}
