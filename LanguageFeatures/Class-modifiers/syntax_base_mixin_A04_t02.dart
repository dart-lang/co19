// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Base mixin can be mixed in but not constructed, extended or
/// implemented and is not exhaustive
///
/// @description Checks that a `base mixin` can be mixed in `base/final/sealed`
/// class in the same library where it is defined (other cases are tested in
/// `basic_restrictions_A04_t*`)
/// @author sgrekhov22@gmail.com

base mixin BaseMixin {}

base class BaseClassWithBaseMixin with BaseMixin {}

final class FinalClassWithBaseMixin with BaseMixin {}

sealed class SealedClassWithBaseMixin with BaseMixin {}

abstract base class AbstractBaseClassWithBaseMixin with BaseMixin {}

abstract final class AbstractFinalClassWithBaseMixin with BaseMixin {}

enum EnumWithBaseMixin with BaseMixin { e1, e2 }

main() {
  print(BaseClassWithBaseMixin);
  print(FinalClassWithBaseMixin);
  print(SealedClassWithBaseMixin);
  print(AbstractBaseClassWithBaseMixin);
  print(AbstractFinalClassWithBaseMixin);
  print(EnumWithBaseMixin);
}
