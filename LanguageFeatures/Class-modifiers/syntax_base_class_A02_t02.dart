// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Base class can be constructed and extended but not implemented,
/// mixed in and is not exhaustive
///
/// @description Checks that it is not an error if a `base class` is
/// implemented by `base/final/sealed` in the same library where it is defined
/// (other cases tested in `basic_restrictions_A03_t*`)
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

base class LocalBaseClass {}

base class BaseClassImplementsLocalBaseClass implements LocalBaseClass {}

final class FinalClassImplementsLocalBaseClass implements LocalBaseClass {}

sealed class SealedClassImplementsLocalBaseClass implements LocalBaseClass {}

abstract base class AbstractBaseClassImplementsLocalBaseClass
    implements LocalBaseClass {}

abstract final class AbstractFinalClassImplementsLocalBaseClass
    implements LocalBaseClass {}

base mixin class BaseMixinClassImplementsBaseClass implements LocalBaseClass {}

abstract base mixin class AbstractBaseMixinClassImplementsBaseClass
    implements LocalBaseClass {}

base mixin BaseMixinImplementsBaseClass implements LocalBaseClass {}

enum EnumImplementsBaseClass implements LocalBaseClass {e1, e2}

main() {
  print(BaseClassImplementsLocalBaseClass);
  print(FinalClassImplementsLocalBaseClass);
  print(SealedClassImplementsLocalBaseClass);
  print(AbstractBaseClassImplementsLocalBaseClass);
  print(AbstractFinalClassImplementsLocalBaseClass);
  print(BaseMixinClassImplementsBaseClass);
  print(AbstractBaseMixinClassImplementsBaseClass);
  print(BaseMixinImplementsBaseClass);
  print(EnumImplementsBaseClass);
}
