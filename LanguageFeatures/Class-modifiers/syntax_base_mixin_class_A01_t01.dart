// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Base mixin class can be constructed, extended and mixed in but
/// not implemented and is not exhaustive
///
/// @description Checks that a `base mixin class` can be constructed and
/// extended by `base/final/sealed` outside of the library where it is defined
/// (other cases are tested in `basic_restrictions_A04_t*`)
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

base class BaseClassExtendsBaseMixinClass extends BaseMixinClass {}

final class FinalClassExtendsBaseMixinClass extends BaseMixinClass {}

sealed class SealedClassExtendsBaseMixinClass extends BaseMixinClass {}

abstract base class AbstractBaseClassExtendsBaseMixinClass
    extends BaseMixinClass {}

abstract final class AbstractFinalClassExtendsBaseMixinClass
    extends BaseMixinClass {}

main() {
  BaseMixinClass();
  print(BaseClassExtendsBaseMixinClass);
  print(FinalClassExtendsBaseMixinClass);
  print(SealedClassExtendsBaseMixinClass);
  print(AbstractBaseClassExtendsBaseMixinClass);
  print(AbstractFinalClassExtendsBaseMixinClass);
}
