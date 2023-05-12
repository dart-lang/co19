// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Base mixin class can be constructed, extended and mixed in but
/// not implemented and is not exhaustive
///
/// @description Checks that a `base mixin class` can be mixed in
/// `base/final/sealed` outside of the library where it is defined
/// (other cases are tested in `basic_restrictions_A04_t*`)
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

base class BaseClassWithBaseMixinClass with BaseMixinClass {}

final class FinalClassWithBaseMixinClass with BaseMixinClass {}

sealed class SealedClassWithBaseMixinClass with BaseMixinClass {}

abstract base class AbstractBaseClassWithBaseMixinClass with BaseMixinClass {}

abstract final class AbstractFinalClassWithBaseMixinClass with BaseMixinClass {}

enum EnumWithBaseMixinClass with BaseMixinClass { e1, e2 }

main() {
  print(BaseClassWithBaseMixinClass);
  print(FinalClassWithBaseMixinClass);
  print(SealedClassWithBaseMixinClass);
  print(AbstractBaseClassWithBaseMixinClass);
  print(AbstractFinalClassWithBaseMixinClass);
  print(EnumWithBaseMixinClass);
}
