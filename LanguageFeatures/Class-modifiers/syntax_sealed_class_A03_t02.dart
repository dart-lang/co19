// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Sealed class cannot be constructed, extended, implemented or
/// mixed in but is exhaustive
///
/// @description Checks that it is not an error if `sealed class` is implemented
/// inside the library where it is defined
/// @author sgrekhov22@gmail.com

sealed class SealedClass {}

class ClassImplementsSealedClass implements SealedClass {}

base class BaseClassImplementsSealedClass implements SealedClass {}

interface class InterfaceClassImplementsSealedClass implements SealedClass {}

final class FinalClassImplementsSealedClass implements SealedClass {}

sealed class SealedClassImplementsSealedClass implements SealedClass {}

abstract class AbstractClassImplementsSealedClass implements SealedClass {}

abstract base class AbstractBaseClassImplementsSealedClass
    implements SealedClass {}

abstract interface class AbstractInterfaceClassImplementsSealedClass
    implements SealedClass {}

abstract final class AbstractFinalClassImplementsSealedClass
    implements SealedClass {}

mixin class MixinClassImplementsSealedClass implements SealedClass {}

base mixin class BaseMixinClassImplementsSealedClass implements SealedClass {}

abstract mixin class AbstractMixinClassImplementsSealedClass
    implements SealedClass {}

abstract base mixin class AbstractBaseMixinClassImplementsSealedClass
    implements SealedClass {}

mixin MixinImplementsSealedClass implements SealedClass {}

base mixin BaseMixinImplementsSealedClass implements SealedClass {}

enum EnumImplementsSealedClass implements SealedClass {e1, e2}

main() {
  print(ClassImplementsSealedClass);
  print(BaseClassImplementsSealedClass);
  print(InterfaceClassImplementsSealedClass);
  print(FinalClassImplementsSealedClass);
  print(SealedClassImplementsSealedClass);
  print(AbstractClassImplementsSealedClass);
  print(AbstractBaseClassImplementsSealedClass);
  print(AbstractInterfaceClassImplementsSealedClass);
  print(AbstractFinalClassImplementsSealedClass);
  print(MixinClassImplementsSealedClass);
  print(BaseMixinClassImplementsSealedClass);
  print(AbstractMixinClassImplementsSealedClass);
  print(AbstractBaseMixinClassImplementsSealedClass);
  print(MixinImplementsSealedClass);
  print(BaseMixinImplementsSealedClass);
  print(EnumImplementsSealedClass);
}
