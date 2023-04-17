// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - A declaration depends directly on a sealed declaration from another
///   library.
///
/// @description Check that it is not an error if a declaration depends on
/// a `sealed` declaration from another library, but not directly. Test class
/// that implements a `sealed` class
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

class ExtendsSealed extends ImplementsSealedClass with MixinOnSealed {}

base class BaseExtendsSealed extends ImplementsSealedClass with MixinOnSealed {}

interface class InterfaceExtendsSealed extends ImplementsSealedClass
    with MixinOnSealed {}

final class FinalExtendsSealed extends ImplementsSealedClass
    with MixinOnSealed {}

sealed class SealedExtendsSealed extends ImplementsSealedClass
    with MixinOnSealed {}

abstract class AbstractExtendsSealed extends ImplementsSealedClass
    with MixinOnSealed {}

abstract base class AbstractBaseExtendsSealed extends ImplementsSealedClass
    with MixinOnSealed {}

abstract interface class AbstractInterfaceExtendsSealed
    extends ImplementsSealedClass with MixinOnSealed {}

abstract final class AbstractFinalExtendsSealed extends ImplementsSealedClass
    with MixinOnSealed {}

class ImplementsSealed implements ImplementsSealedClass {}

base class BaseImplementsSealed implements ImplementsSealedClass {}

interface class InterfaceImplementsSealed implements ImplementsSealedClass {}

final class FinalImplementsSealed implements ImplementsSealedClass {}

sealed class SealedImplementsSealed implements ImplementsSealedClass {}

abstract class AbstractImplementsSealed implements ImplementsSealedClass {}

abstract base class AbstractBaseImplementsSealed
    implements ImplementsSealedClass {}

abstract interface class AbstractInterfaceImplementsSealed
    implements ImplementsSealedClass {}

abstract final class AbstractFinalImplementsSealed
    implements ImplementsSealedClass {}

mixin class MixinClass implements ImplementsSealedClass {}

base mixin class BaseMixinClass implements ImplementsSealedClass {}

abstract mixin class AbstractMixinClass implements ImplementsSealedClass {}

abstract base mixin class AbstractBaseMixinClass
    implements ImplementsSealedClass {}

mixin MixinImplementsImplementsSealedClass implements ImplementsSealedClass {}

base mixin BaseMixinImplementsImplementsSealedClass
    implements ImplementsSealedClass {}

mixin MixinOnImplementsSealedClass on ImplementsSealedClass {}

base mixin BaseMixinOnImplementsSealedClass on ImplementsSealedClass {}

main() {
  print(ExtendsSealed);
  print(BaseExtendsSealed);
  print(InterfaceExtendsSealed);
  print(FinalExtendsSealed);
  print(SealedExtendsSealed);
  print(AbstractExtendsSealed);
  print(AbstractBaseExtendsSealed);
  print(AbstractInterfaceExtendsSealed);
  print(AbstractFinalExtendsSealed);
  print(ImplementsSealed);
  print(BaseImplementsSealed);
  print(InterfaceImplementsSealed);
  print(FinalImplementsSealed);
  print(SealedImplementsSealed);
  print(AbstractImplementsSealed);
  print(AbstractBaseImplementsSealed);
  print(AbstractInterfaceImplementsSealed);
  print(AbstractFinalImplementsSealed);
  print(MixinClass);
  print(BaseMixinClass);
  print(AbstractMixinClass);
  print(AbstractBaseMixinClass);
  print(MixinImplementsImplementsSealedClass);
  print(BaseMixinImplementsImplementsSealedClass);
  print(MixinOnImplementsSealedClass);
  print(BaseMixinOnImplementsSealedClass);
}
