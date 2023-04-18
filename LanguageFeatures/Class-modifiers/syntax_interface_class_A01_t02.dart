// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Interface class can be constructed and implemented but not
/// extended or mixed in and is not exhaustive
///
/// @description Checks that `interface class` can be constructed and
/// implemented inside the library where it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

interface class InterfaceClass {}

class ClassImplementsInterfaceClass implements InterfaceClass {}

base class BaseClassImplementsInterfaceClass implements InterfaceClass {}

interface class InterfaceClassImplementsInterfaceClass
    implements InterfaceClass {}

final class FinalClassImplementsInterfaceClass implements InterfaceClass {}

sealed class SealedClassImplementsInterfaceClass implements InterfaceClass {}

abstract class AbstractClassImplementsInterfaceClass
    implements InterfaceClass {}

abstract base class AbstractBaseClassImplementsInterfaceClass
    implements InterfaceClass {}

abstract interface class AbstractInterfaceClassImplementsInterfaceClass
    implements InterfaceClass {}

abstract final class AbstractFinalClassImplementsInterfaceClass
    implements InterfaceClass {}

mixin class MixinClassImplementsInterfaceClass implements InterfaceClass {}

base mixin class BaseMixinClassImplementsInterfaceClass
    implements InterfaceClass {}

abstract mixin class AbstractMixinClassImplementsInterfaceClass
    implements InterfaceClass {}

abstract base mixin class AbstractBaseMixinClassImplementsInterfaceClass
    implements InterfaceClass {}

mixin MixinImplementsInterfaceClass implements InterfaceClass {}

base mixin BaseMixinImplementsInterfaceClass implements InterfaceClass {}

main() {
  InterfaceClass();

  print(ClassImplementsInterfaceClass);
  print(BaseClassImplementsInterfaceClass);
  print(InterfaceClassImplementsInterfaceClass);
  print(FinalClassImplementsInterfaceClass);
  print(SealedClassImplementsInterfaceClass);
  print(AbstractClassImplementsInterfaceClass);
  print(AbstractBaseClassImplementsInterfaceClass);
  print(AbstractInterfaceClassImplementsInterfaceClass);
  print(AbstractFinalClassImplementsInterfaceClass);
  print(MixinClassImplementsInterfaceClass);
  print(BaseMixinClassImplementsInterfaceClass);
  print(AbstractMixinClassImplementsInterfaceClass);
  print(AbstractBaseMixinClassImplementsInterfaceClass);
  print(MixinImplementsInterfaceClass);
  print(BaseMixinImplementsInterfaceClass);
}
