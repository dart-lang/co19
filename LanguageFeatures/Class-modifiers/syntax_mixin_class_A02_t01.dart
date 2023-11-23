// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Mixin class can be constructed, extended, implemented and mixed
/// in but is not exhaustive
///
/// @description Checks that a `mixin class` can be implemented outside of the
/// library where it is defined
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

class ClassImplementsMixinClass implements MixinClass {}

base class BaseClassImplementsMixinClass implements MixinClass {}

interface class InterfaceClassImplementsMixinClass implements MixinClass {}

final class FinalClassImplementsMixinClass implements MixinClass {}

sealed class SealedClassImplementsMixinClass implements MixinClass {}

abstract class AbstractClassImplementsMixinClass implements MixinClass {}

abstract base class AbstractBaseClassImplementsMixinClass
    implements MixinClass {}

abstract interface class AbstractInterfaceClassImplementsMixinClass
    implements MixinClass {}

abstract final class AbstractFinalClassImplementsMixinClass
    implements MixinClass {}

mixin class MixinClassImplementsMixinClass implements MixinClass {}

base mixin class BaseMixinClassImplementsMixinClass implements MixinClass {}

abstract mixin class AbstractMixinClassImplementsMixinClass
    implements MixinClass {}

abstract base mixin class AbstractBaseMixinClassImplementsMixinClass
    implements MixinClass {}

mixin MixinImplementsMixinClass implements MixinClass {}

base mixin BaseMixinImplementsMixinClass implements MixinClass {}

enum EnumImplementsMixinClass implements MixinClass { e1, e2 }

main() {
  print(ClassImplementsMixinClass);
  print(BaseClassImplementsMixinClass);
  print(InterfaceClassImplementsMixinClass);
  print(FinalClassImplementsMixinClass);
  print(SealedClassImplementsMixinClass);
  print(AbstractClassImplementsMixinClass);
  print(AbstractBaseClassImplementsMixinClass);
  print(AbstractInterfaceClassImplementsMixinClass);
  print(AbstractFinalClassImplementsMixinClass);
  print(MixinClassImplementsMixinClass);
  print(BaseMixinClassImplementsMixinClass);
  print(AbstractMixinClassImplementsMixinClass);
  print(AbstractBaseMixinClassImplementsMixinClass);
  print(MixinImplementsMixinClass);
  print(BaseMixinImplementsMixinClass);
  print(EnumImplementsMixinClass);
}
