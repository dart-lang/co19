// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract base mixin class can be extended and mixed in but not
/// constructed, implemented and is not exhaustive
///
/// @description Checks that an `abstract base mixin class` can be extended by
/// `base/final/sealed` in the same library where it is defined (other cases
/// are tested in `basic_restrictions_A04_t*`)
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

abstract base mixin class AbstractBaseMixinClass {}

base class BaseClassExtendsAbstractBaseMixinClass
    extends AbstractBaseMixinClass {}

final class FinalClassExtendsAbstractBaseMixinClass
    extends AbstractBaseMixinClass {}

sealed class SealedClassExtendsAbstractBaseMixinClass
    extends AbstractBaseMixinClass {}

abstract base class AbstractBaseClassExtendsAbstractBaseMixinClass
    extends AbstractBaseMixinClass {}

abstract final class AbstractFinalClassExtendsAbstractBaseMixinClass
    extends AbstractBaseMixinClass {}

main() {
  BaseMixinClass();
  print(BaseClassExtendsAbstractBaseMixinClass);
  print(FinalClassExtendsAbstractBaseMixinClass);
  print(SealedClassExtendsAbstractBaseMixinClass);
  print(AbstractBaseClassExtendsAbstractBaseMixinClass);
  print(AbstractFinalClassExtendsAbstractBaseMixinClass);
}
