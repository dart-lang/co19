// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - A declaration depends directly on a sealed declaration from another
///   library.
///
/// @description Check that it is no error if a declaration directly implements
/// a `sealed` declaration from the same library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

sealed class SealedClass {}

class ImplementsSealedClass implements SealedClass {}

base class BaseImplementsSealedClass implements SealedClass {}

interface class InterfaceImplementsSealedClass implements SealedClass {}

final class FinalImplementsSealedClass implements SealedClass {}

sealed class SealedImplementsSealedClass implements SealedClass {}

abstract class AbstractImplementsSealedClass implements SealedClass {}

abstract base class AbstractBaseImplementsSealedClass implements SealedClass {}

abstract interface class AbstractInterfaceImplementsSealedClass
    implements SealedClass {}

abstract final class AbstractFinalImplementsSealedClass
    implements SealedClass {}

mixin class MixinClassImplementsSealedClass implements SealedClass {}

base mixin class BaseMixinClassImplementsSealedClass implements SealedClass {}

abstract mixin class AbstractMixinClassImplementsSealedClass
    implements SealedClass {}

abstract base mixin class AbstractBaseMixinClassImplementsSealedClass
    implements SealedClass {}

mixin MixinImplementsSealedClass implements SealedClass {}

base mixin BaseMixinImplementsSealedClass implements SealedClass {}

enum EnumImplementsSealedClass implements SealedClass { e1, e2 }

main() {
  print(ImplementsSealedClass);
  print(BaseImplementsSealedClass);
  print(InterfaceImplementsSealedClass);
  print(FinalImplementsSealedClass);
  print(SealedImplementsSealedClass);
  print(AbstractImplementsSealedClass);
  print(AbstractBaseImplementsSealedClass);
  print(AbstractInterfaceImplementsSealedClass);
  print(AbstractFinalImplementsSealedClass);
  print(MixinClassImplementsSealedClass);
  print(BaseMixinClassImplementsSealedClass);
  print(AbstractMixinClassImplementsSealedClass);
  print(AbstractBaseMixinClassImplementsSealedClass);
  print(MixinImplementsSealedClass);
  print(BaseMixinImplementsSealedClass);
  print(EnumImplementsSealedClass);
}
