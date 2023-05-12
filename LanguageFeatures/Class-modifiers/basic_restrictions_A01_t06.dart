// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - A declaration depends directly on a sealed declaration from another
///   library.
///
/// @description Check that it is not an error if a declaration depends on
/// a `sealed` declaration from another library, but not directly. Test mixin
/// on a `sealed` class
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

class ImplementsMixinOnSealed implements MixinOnSealed {}

base class BaseImplementsMixinOnSealed implements MixinOnSealed {}

interface class InterfaceImplementsMixinOnSealed implements MixinOnSealed {}

final class FinalImplementsMixinOnSealed implements MixinOnSealed {}

sealed class SealedImplementsMixinOnSealed implements MixinOnSealed {}

abstract class AbstractImplementsMixinOnSealed implements MixinOnSealed {}

abstract base class AbstractBaseImplementsMixinOnSealed
    implements MixinOnSealed {}

abstract interface class AbstractInterfaceImplementsMixinOnSealed
    implements MixinOnSealed {}

abstract final class AbstractFinalImplementsMixinOnSealed
    implements MixinOnSealed {}

mixin class MixinClass implements MixinOnSealed {}

base mixin class BaseMixinClass implements MixinOnSealed {}

abstract mixin class AbstractMixinClass implements MixinOnSealed {}

abstract base mixin class AbstractBaseMixinClass implements MixinOnSealed {}

mixin MixinImplementsImplementsMixinOnSealed implements MixinOnSealed {}

base mixin BaseMixinImplementsImplementsMixinOnSealed
    implements MixinOnSealed {}

mixin MixinOnMixinOnSealed on MixinOnSealed {}

base mixin BaseMixinOnMixinOnSealed on MixinOnSealed {}

main() {
  print(ImplementsMixinOnSealed);
  print(BaseImplementsMixinOnSealed);
  print(InterfaceImplementsMixinOnSealed);
  print(FinalImplementsMixinOnSealed);
  print(SealedImplementsMixinOnSealed);
  print(AbstractImplementsMixinOnSealed);
  print(AbstractBaseImplementsMixinOnSealed);
  print(AbstractInterfaceImplementsMixinOnSealed);
  print(AbstractFinalImplementsMixinOnSealed);
  print(MixinClass);
  print(BaseMixinClass);
  print(AbstractMixinClass);
  print(AbstractBaseMixinClass);
  print(MixinImplementsImplementsMixinOnSealed);
  print(BaseMixinImplementsImplementsMixinOnSealed);
  print(MixinOnMixinOnSealed);
  print(BaseMixinOnMixinOnSealed);
}
