// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Base mixin class can be constructed, extended and mixed in but
/// not implemented and is not exhaustive
///
/// @description Checks that it is not an error to implement a
/// `base mixin class` by `base/final/sealed` in the same library where it is
/// defined
/// @author sgrekhov22@gmail.com

base mixin class BaseMixinClass {}

base class BaseClassImplementsBaseMixinClass implements BaseMixinClass {}

final class FinalClassImplementsBaseMixinClass implements BaseMixinClass {}

sealed class SealedClassImplementsBaseMixinClass implements BaseMixinClass {}

abstract base class AbstractBaseClassImplementsBaseMixinClass
    implements BaseMixinClass {}

abstract final class AbstractFinalClassImplementsBaseMixinClass
    implements BaseMixinClass {}

base mixin class BaseMixinClassImplementsBaseMixinClass
    implements BaseMixinClass {}

abstract base mixin class AbstractBaseMixinClassImplementsBaseMixinClass
    implements BaseMixinClass {}

base mixin BaseMixinImplementsBaseMixinClass implements BaseMixinClass {}

enum EnumImplementsBaseMixinClass implements BaseMixinClass { e1, e2 }

main() {
  print(BaseClassImplementsBaseMixinClass);
  print(FinalClassImplementsBaseMixinClass);
  print(SealedClassImplementsBaseMixinClass);
  print(AbstractBaseClassImplementsBaseMixinClass);
  print(AbstractFinalClassImplementsBaseMixinClass);
  print(BaseMixinClassImplementsBaseMixinClass);
  print(AbstractBaseMixinClassImplementsBaseMixinClass);
  print(BaseMixinImplementsBaseMixinClass);
  print(EnumImplementsBaseMixinClass);
}
