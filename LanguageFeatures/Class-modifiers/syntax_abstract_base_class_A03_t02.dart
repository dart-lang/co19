// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract base class can be extended but not constructed,
/// implemented or mixed in and is not exhaustive
///
/// @description Check that it is not an error to implement an
/// `abstract base class` (by `base/final/sealed`), in the same library where it
/// is defined (other cases tested in `basic_restrictions_A03_t*`)
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

abstract base class AbstractBaseClass {}

base class BaseClassImplementsBaseClass implements AbstractBaseClass {}

final class FinalClassImplementsBaseClass implements AbstractBaseClass {}

sealed class SealedClassImplementsBaseClass implements AbstractBaseClass {}

abstract base class AbstractBaseClassImplementsBaseClass
    implements AbstractBaseClass {}

abstract final class AbstractFinalClassImplementsBaseClass
    implements AbstractBaseClass {}

base mixin class BaseMixinImplementsAbstractBaseClass
    implements AbstractBaseClass {}

abstract base mixin class AbstractBaseMixinImplementsAbstractBaseClass
    implements AbstractBaseClass {}

enum EnumImplementsAbstractBaseClass implements AbstractBaseClass { e1, e2 }

main() {
  print(BaseClassImplementsBaseClass);
  print(FinalClassImplementsBaseClass);
  print(SealedClassImplementsBaseClass);
  print(AbstractBaseClassImplementsBaseClass);
  print(AbstractFinalClassImplementsBaseClass);
  print(BaseMixinImplementsAbstractBaseClass);
  print(AbstractBaseMixinImplementsAbstractBaseClass);
  print(EnumImplementsAbstractBaseClass);
}
