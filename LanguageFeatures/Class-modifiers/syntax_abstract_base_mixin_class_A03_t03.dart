// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract base mixin class can be extended and mixed in but not
/// constructed, implemented and is not exhaustive
///
/// @description Checks that it is not an error to implement an
/// `abstract base mixin class` by `base/final/sealed` in the same library where
/// it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

abstract base mixin class AbstractBaseMixinClass {}

base class BaseClassImplementsAbstractBaseMixinClass
    implements AbstractBaseMixinClass {}

final class FinalClassImplementsAbstractBaseMixinClass
    implements AbstractBaseMixinClass {}

sealed class SealedClassImplementsAbstractBaseMixinClass
    implements AbstractBaseMixinClass {}

abstract base class AbstractBaseClassImplementsAbstractBaseMixinClass
    implements AbstractBaseMixinClass {}

abstract final class AbstractFinalClassImplementsAbstractBaseMixinClass
    implements AbstractBaseMixinClass {}

base mixin class BaseMixinClassImplementsAbstractBaseMixinClass
    implements AbstractBaseMixinClass {}

abstract base mixin class AbstractBaseMixinClassImplementsAbstractBaseMixinClass
    implements AbstractBaseMixinClass {}

base mixin BaseMixinImplementsAbstractBaseMixinClass
    implements AbstractBaseMixinClass {}

enum EnumImplementsAbstractBaseMixinClass implements AbstractBaseMixinClass {
  e1,
  e2
}

main() {
  print(BaseClassImplementsAbstractBaseMixinClass);
  print(FinalClassImplementsAbstractBaseMixinClass);
  print(SealedClassImplementsAbstractBaseMixinClass);
  print(AbstractBaseClassImplementsAbstractBaseMixinClass);
  print(AbstractFinalClassImplementsAbstractBaseMixinClass);
  print(BaseMixinClassImplementsAbstractBaseMixinClass);
  print(AbstractBaseMixinClassImplementsAbstractBaseMixinClass);
  print(BaseMixinImplementsAbstractBaseMixinClass);
  print(EnumImplementsAbstractBaseMixinClass);
}
