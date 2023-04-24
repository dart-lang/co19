// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract final class cannot be constructed, extended, implemented
/// or mixed in and is not exhaustive
///
/// @description Checks that it is not an error to implement
/// `abstract final class` in the same library where it is defined by a class
/// with `base/final/sealed` modifier
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

abstract final class AbstractFinalClass {}

base class BaseImplementsAbstractFinalClass implements AbstractFinalClass {}

final class FinalImplementsAbstractFinalClass implements AbstractFinalClass {}

sealed class SealedImplementsAbstractFinalClass implements AbstractFinalClass {}

abstract base class AbstractBaseImplementsAbstractFinalClass
    implements AbstractFinalClass {}

abstract final class AbstractFinalImplementsAbstractFinalClass
    implements AbstractFinalClass {}

base mixin class BaseMixinClassImplementsAbstractFinalClass
    implements AbstractFinalClass {}

abstract base mixin class AbstractBaseMixinClassImplementsAbstractFinalClass
    implements AbstractFinalClass {}

base mixin BaseMixinImplementsAbstractFinalClass
    implements AbstractFinalClass {}

enum EnumImplementsAbstractFinalClass implements AbstractFinalClass { e1, e2 }

main() {
  print(BaseImplementsAbstractFinalClass);
  print(FinalImplementsAbstractFinalClass);
  print(SealedImplementsAbstractFinalClass);
  print(AbstractBaseImplementsAbstractFinalClass);
  print(AbstractFinalImplementsAbstractFinalClass);
  print(BaseMixinClassImplementsAbstractFinalClass);
  print(AbstractBaseMixinClassImplementsAbstractFinalClass);
  print(BaseMixinImplementsAbstractFinalClass);
  print(EnumImplementsAbstractFinalClass);
}
