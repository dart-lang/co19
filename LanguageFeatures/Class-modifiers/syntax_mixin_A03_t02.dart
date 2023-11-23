// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Mixin can be implemented and mixed in but not constructed or
/// extended and is not exhaustive
///
/// @description Checks that a `mixin` can be implemented in the same library
/// where it is defined
/// @author sgrekhov22@gmail.com

mixin Mixin {}

class ClassImplementsMixin implements Mixin {}

base class BaseClassImplementsMixin implements Mixin {}

interface class InterfaceClassImplementsMixin implements Mixin {}

final class FinalClassImplementsMixin implements Mixin {}

sealed class SealedClassImplementsMixin implements Mixin {}

abstract class AbstractClassImplementsMixin implements Mixin {}

abstract base class AbstractBaseClassImplementsMixin implements Mixin {}

abstract interface class AbstractInterfaceClassImplementsMixin
    implements Mixin {}

abstract final class AbstractFinalClassImplementsMixin implements Mixin {}

mixin class MixinClassImplementsMixin implements Mixin {}

base mixin class BaseMixinClassImplementsMixin implements Mixin {}

abstract mixin class AbstractMixinClassImplementsMixin implements Mixin {}

abstract base mixin class AbstractBaseMixinClassImplementsMixin
    implements Mixin {}

mixin MixinImplementsMixin implements Mixin {}

base mixin BaseMixinImplementsMixin implements Mixin {}

enum EnumImplementsMixin implements Mixin { e1, e2 }

main() {
  print(ClassImplementsMixin);
  print(BaseClassImplementsMixin);
  print(InterfaceClassImplementsMixin);
  print(FinalClassImplementsMixin);
  print(SealedClassImplementsMixin);
  print(AbstractClassImplementsMixin);
  print(AbstractBaseClassImplementsMixin);
  print(AbstractInterfaceClassImplementsMixin);
  print(AbstractFinalClassImplementsMixin);
  print(MixinClassImplementsMixin);
  print(BaseMixinClassImplementsMixin);
  print(AbstractMixinClassImplementsMixin);
  print(AbstractBaseMixinClassImplementsMixin);
  print(MixinImplementsMixin);
  print(BaseMixinImplementsMixin);
  print(EnumImplementsMixin);
}
