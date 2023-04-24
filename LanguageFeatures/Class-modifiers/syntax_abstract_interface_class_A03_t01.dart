// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract interface class can be implemented but not constructed,
/// extended or mixed in and is not exhaustive
///
/// @description Checks that `abstract interface class` can be implemented
/// outside of the library where it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

class ClassImplementsAbstractInterfaceClass implements AbstractInterfaceClass {}

base class BaseClassImplementsAbstractInterfaceClass
    implements AbstractInterfaceClass {}

interface class InterfaceClassImplementsAbstractInterfaceClass
    implements AbstractInterfaceClass {}

final class FinalClassImplementsAbstractInterfaceClass
    implements AbstractInterfaceClass {}

sealed class SealedClassImplementsAbstractInterfaceClass
    implements AbstractInterfaceClass {}

abstract class AbstractClassImplementsAbstractInterfaceClass
    implements AbstractInterfaceClass {}

abstract base class AbstractBaseClassImplementsAbstractInterfaceClass
    implements AbstractInterfaceClass {}

abstract interface class AbstractInterfaceClassImplementsAbstractInterfaceClass
    implements AbstractInterfaceClass {}

abstract final class AbstractFinalClassImplementsAbstractInterfaceClass
    implements AbstractInterfaceClass {}

mixin class MixinClassImplementsAbstractInterfaceClass
    implements AbstractInterfaceClass {}

base mixin class BaseMixinClassImplementsAbstractInterfaceClass
    implements AbstractInterfaceClass {}

abstract mixin class AbstractMixinClassImplementsAbstractInterfaceClass
    implements AbstractInterfaceClass {}

abstract base mixin class AbstractBaseMixinClassImplementsAbstractInterfaceClass
    implements AbstractInterfaceClass {}

mixin MixinImplementsAbstractInterfaceClass implements AbstractInterfaceClass {}

base mixin BaseMixinImplementsAbstractInterfaceClass
    implements AbstractInterfaceClass {}

enum EnumImplementsAbstractInterfaceClass implements AbstractInterfaceClass {e1}

main() {
  print(ClassImplementsAbstractInterfaceClass);
  print(BaseClassImplementsAbstractInterfaceClass);
  print(InterfaceClassImplementsAbstractInterfaceClass);
  print(FinalClassImplementsAbstractInterfaceClass);
  print(SealedClassImplementsAbstractInterfaceClass);
  print(AbstractClassImplementsAbstractInterfaceClass);
  print(AbstractBaseClassImplementsAbstractInterfaceClass);
  print(AbstractInterfaceClassImplementsAbstractInterfaceClass);
  print(AbstractFinalClassImplementsAbstractInterfaceClass);
  print(MixinClassImplementsAbstractInterfaceClass);
  print(BaseMixinClassImplementsAbstractInterfaceClass);
  print(AbstractMixinClassImplementsAbstractInterfaceClass);
  print(AbstractBaseMixinClassImplementsAbstractInterfaceClass);
  print(MixinImplementsAbstractInterfaceClass);
  print(BaseMixinImplementsAbstractInterfaceClass);
  print(EnumImplementsAbstractInterfaceClass);
}
