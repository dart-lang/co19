// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - A declaration depends directly on a sealed declaration from another
///   library.
///
/// @description Check that it is not an error if a declaration depends
/// a `sealed` declaration from another library but not directly
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

class ExtendsSealed extends ExtendsSealedClass with MixinOnSealed {}

base class BaseExtendsSealed extends ExtendsSealedClass with MixinOnSealed {}

interface class InterfaceExtendsSealed extends ExtendsSealedClass
    with MixinOnSealed {}

final class FinalExtendsSealed extends ExtendsSealedClass with MixinOnSealed {}

sealed class SealedExtendsSealed extends ExtendsSealedClass
    with MixinOnSealed {}

abstract class AbstractExtendsSealed extends ExtendsSealedClass
    with MixinOnSealed {}

abstract base class AbstractBaseExtendsSealed extends ExtendsSealedClass
    with MixinOnSealed {}

abstract interface class AbstractInterfaceExtendsSealed
    extends ExtendsSealedClass with MixinOnSealed {}

abstract final class AbstractFinalExtendsSealed extends ExtendsSealedClass
    with MixinOnSealed {}

class ImplementsSealed implements ExtendsSealedClass {}

base class BaseImplementsSealed implements ExtendsSealedClass {}

interface class InterfaceImplementsSealed implements ExtendsSealedClass {}

final class FinalImplementsSealed implements ExtendsSealedClass {}

sealed class SealedImplementsSealed implements ExtendsSealedClass {}

abstract class AbstractImplementsSealed implements ExtendsSealedClass {}

abstract base class AbstractBaseImplementsSealed
    implements ExtendsSealedClass {}

abstract interface class AbstractInterfaceImplementsSealed
    implements ExtendsSealedClass {}

abstract final class AbstractFinalImplementsSealed
    implements ExtendsSealedClass {}

mixin class MixinClass implements ExtendsSealedClass {}

base mixin class BaseMixinClass implements ExtendsSealedClass {}

abstract mixin class AbstractMixinClass implements ExtendsSealedClass {}

abstract base mixin class AbstractBaseMixinClass
    implements ExtendsSealedClass {}

mixin Mixin implements ExtendsSealedClass {}

base mixin BaseMixin implements ExtendsSealedClass {}

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
  print(Mixin);
  print(BaseMixin);
}
