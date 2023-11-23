// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Class with no modifiers can be constructed, extended, implemented
/// but not mixed in and is not exhaustive
///
/// @description Checks that class with no modifiers can implemented in another
/// library
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

class ClassImplementsClass implements Class {}

base class BaseClassImplementsClass implements Class {}

interface class InterfaceClassImplementsClass implements Class {}

final class FinalClassImplementsClass implements Class {}

sealed class SealedClassImplementsClass implements Class {}

abstract class AbstractClassImplementsClass implements Class {}

abstract base class AbstractBaseClassImplementsClass implements Class {}

abstract interface class AbstractInterfaceClassImplementsClass
    implements Class {}

abstract final class AbstractFinalClassImplementsClass implements Class {}

mixin class MixinClassImplementsClass implements Class {}

base mixin class BaseMixinClassImplementsClass implements Class {}

abstract mixin class AbstractMixinClassImplementsClass implements Class {}

abstract base mixin class AbstractBaseMixinClassImplementsClass
    implements Class {}

mixin MixinImplementsClass implements Class {}

base mixin BaseMixinImplementsClass implements Class {}

enum EnumImplementsClass implements Class {e1, e2}

main() {
  print(ClassImplementsClass);
  print(BaseClassImplementsClass);
  print(InterfaceClassImplementsClass);
  print(FinalClassImplementsClass);
  print(SealedClassImplementsClass);
  print(AbstractClassImplementsClass);
  print(AbstractBaseClassImplementsClass);
  print(AbstractInterfaceClassImplementsClass);
  print(AbstractFinalClassImplementsClass);
  print(MixinClassImplementsClass);
  print(BaseMixinClassImplementsClass);
  print(AbstractMixinClassImplementsClass);
  print(AbstractBaseMixinClassImplementsClass);
  print(MixinImplementsClass);
  print(BaseMixinImplementsClass);
  print(EnumImplementsClass);
}
