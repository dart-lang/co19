// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract mixin class can be extended, implemented and mixed in
/// but not constructed and is not exhaustive
///
/// @description Checks that an `abstract mixin class` can be implemented in the
/// samelibrary where it is defined
/// @author sgrekhov22@gmail.com

abstract mixin class AbstractMixinClass {}

class ClassImplementsAbstractMixinClass implements AbstractMixinClass {}

base class BaseClassImplementsAbstractMixinClass
    implements AbstractMixinClass {}

interface class InterfaceClassImplementsAbstractMixinClass
    implements AbstractMixinClass {}

final class FinalClassImplementsAbstractMixinClass
    implements AbstractMixinClass {}

sealed class SealedClassImplementsAbstractMixinClass
    implements AbstractMixinClass {}

abstract class AbstractClassImplementsAbstractMixinClass
    implements AbstractMixinClass {}

abstract base class AbstractBaseClassImplementsAbstractMixinClass
    implements AbstractMixinClass {}

abstract interface class AbstractInterfaceClassImplementsAbstractMixinClass
    implements AbstractMixinClass {}

abstract final class AbstractFinalClassImplementsAbstractMixinClass
    implements AbstractMixinClass {}

mixin class MixinClassImplementsAbstractMixinClass
    implements AbstractMixinClass {}

base mixin class BaseMixinClassImplementsAbstractMixinClass
    implements AbstractMixinClass {}

abstract mixin class AbstractMixinClassImplementsAbstractMixinClass
    implements AbstractMixinClass {}

abstract base mixin class AbstractBaseMixinClassImplementsAbstractMixinClass
    implements AbstractMixinClass {}

mixin MixinImplementsAbstractMixinClass implements AbstractMixinClass {}

base mixin BaseMixinImplementsAbstractMixinClass
    implements AbstractMixinClass {}

enum EnumImplementsAbstractMixinClass implements AbstractMixinClass { e1, e2 }

main() {
  print(ClassImplementsAbstractMixinClass);
  print(BaseClassImplementsAbstractMixinClass);
  print(InterfaceClassImplementsAbstractMixinClass);
  print(FinalClassImplementsAbstractMixinClass);
  print(SealedClassImplementsAbstractMixinClass);
  print(AbstractClassImplementsAbstractMixinClass);
  print(AbstractBaseClassImplementsAbstractMixinClass);
  print(AbstractInterfaceClassImplementsAbstractMixinClass);
  print(AbstractFinalClassImplementsAbstractMixinClass);
  print(MixinClassImplementsAbstractMixinClass);
  print(BaseMixinClassImplementsAbstractMixinClass);
  print(AbstractMixinClassImplementsAbstractMixinClass);
  print(AbstractBaseMixinClassImplementsAbstractMixinClass);
  print(MixinImplementsAbstractMixinClass);
  print(BaseMixinImplementsAbstractMixinClass);
  print(EnumImplementsAbstractMixinClass);
}
