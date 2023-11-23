// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Base mixin can be mixed in but not constructed, extended or
/// implemented and is not exhaustive
///
/// @description Checks that it is not an error to implement a `base mixin` by a
/// `base/final/sealed` class in the library where it is defined
/// @author sgrekhov22@gmail.com

base mixin BaseMixin {}

base class BaseImplementsBaseMixin implements BaseMixin {}

final class FinalImplementsBaseMixin implements BaseMixin {}

sealed class SealedImplementsBaseMixin implements BaseMixin {}

abstract base class AbstractBaseImplementsBaseMixin implements BaseMixin {}

abstract final class AbstractFinalImplementsBaseMixin implements BaseMixin {}

base mixin class BaseMixinClassImplementsBaseMixin implements BaseMixin {}

abstract base mixin class AbstractBaseMixinClassImplementsBaseMixin
    implements BaseMixin {}

base mixin BaseMixinImplementsBaseMixin implements BaseMixin {}

enum EnumImplementsBaseMixin implements BaseMixin { e1, e2 }

main() {
  print(BaseImplementsBaseMixin);
  print(FinalImplementsBaseMixin);
  print(SealedImplementsBaseMixin);
  print(AbstractBaseImplementsBaseMixin);
  print(AbstractFinalImplementsBaseMixin);
  print(BaseMixinClassImplementsBaseMixin);
  print(AbstractBaseMixinClassImplementsBaseMixin);
  print(BaseMixinImplementsBaseMixin);
  print(EnumImplementsBaseMixin);
}
