// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract class can be extended and implemented but not
/// constructed, mixed in and is not exhaustive
///
/// @description Check that it is not an error to implement an `abstract class`
/// in the same library where it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

abstract class AbstractClass {}

class ClassImplementsAbstractClass implements AbstractClass {}

base class BaseClassImplementsAbstractClass implements AbstractClass {}

interface class InterfaceClassImplementsAbstractClass
    implements AbstractClass {}

final class FinalClassImplementsAbstractClass implements AbstractClass {}

sealed class SealedClassImplementsAbstractClass implements AbstractClass {}

abstract class AbstractClassImplementsAbstractClass implements AbstractClass {}

abstract base class AbstractBaseClassImplementsAbstractClass
    implements AbstractClass {}

abstract interface class AbstractInterfaceClassImplementsAbstractClass
    implements AbstractClass {}

abstract final class AbstractFinalClassImplementsAbstractClass
    implements AbstractClass {}

mixin class MixinClassImplementsAbstractClass implements AbstractClass {}

base mixin class BaseMixinClassImplementsAbstractClass
    implements AbstractClass {}

abstract mixin class AbstractMixinClassImplementsAbstractClass
    implements AbstractClass {}

abstract base mixin class AbstractBaseMixinClassImplementsAbstractClass
    implements AbstractClass {}

mixin MixinImplementsAbstractClass implements AbstractClass {}

base mixin BaseMixinImplementsAbstractClass implements AbstractClass {}

enum EnumImplementsAbstractClass implements AbstractClass {e1, e2}

main() {
  print(ClassImplementsAbstractClass);
  print(BaseClassImplementsAbstractClass);
  print(InterfaceClassImplementsAbstractClass);
  print(FinalClassImplementsAbstractClass);
  print(SealedClassImplementsAbstractClass);
  print(AbstractClassImplementsAbstractClass);
  print(AbstractBaseClassImplementsAbstractClass);
  print(AbstractInterfaceClassImplementsAbstractClass);
  print(AbstractFinalClassImplementsAbstractClass);
  print(MixinClassImplementsAbstractClass);
  print(BaseMixinClassImplementsAbstractClass);
  print(AbstractMixinClassImplementsAbstractClass);
  print(AbstractBaseMixinClassImplementsAbstractClass);
  print(MixinImplementsAbstractClass);
  print(BaseMixinImplementsAbstractClass);
  print(EnumImplementsAbstractClass);
}
