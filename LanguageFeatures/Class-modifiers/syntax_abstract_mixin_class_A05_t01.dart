// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract mixin class can be extended, implemented and mixed in
/// but not constructed and is not exhaustive
///
/// @description Checks that a mixin on an `abstract mixin class` can be
/// declared
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

abstract mixin class LocalAbstractMixinClass {}

mixin MixinOnAbstractMixinClass on AbstractMixinClass {}

base mixin BaseMixinOnAbstractMixinClass on AbstractMixinClass {}

mixin MixinOnLocalAbstractMixinClass on LocalAbstractMixinClass {}

base mixin BaseMixinOnLocalAbstractMixinClass on LocalAbstractMixinClass {}

main() {
  print(MixinOnAbstractMixinClass);
  print(BaseMixinOnAbstractMixinClass);
  print(MixinOnLocalAbstractMixinClass);
  print(BaseMixinOnLocalAbstractMixinClass);
}
