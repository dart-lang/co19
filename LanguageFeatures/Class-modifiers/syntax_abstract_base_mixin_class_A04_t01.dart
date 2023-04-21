// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract base mixin class can be extended and mixed in but not
/// constructed, implemented and is not exhaustive
///
/// @description Checks that an `abstract base mixin class` can be mixed in
/// `base/final/sealed` outside of the library where it is defined
/// (other cases are tested in `basic_restrictions_A04_t*`)
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

base class BaseClassWithAbstractBaseMixinClass with AbstractBaseMixinClass {}

final class FinalClassWithAbstractBaseMixinClass with AbstractBaseMixinClass {}

sealed class SealedClassWithAbstractBaseMixinClass
    with AbstractBaseMixinClass {}

abstract base class AbstractBaseClassWithAbstractBaseMixinClass
    with AbstractBaseMixinClass {}

abstract final class AbstractFinalClassWithAbstractBaseMixinClass
    with AbstractBaseMixinClass {}

enum EnumWithAbstractBaseMixinClass with AbstractBaseMixinClass { e1, e2 }

main() {
  print(BaseClassWithAbstractBaseMixinClass);
  print(FinalClassWithAbstractBaseMixinClass);
  print(SealedClassWithAbstractBaseMixinClass);
  print(AbstractBaseClassWithAbstractBaseMixinClass);
  print(AbstractFinalClassWithAbstractBaseMixinClass);
  print(EnumWithAbstractBaseMixinClass);
}
