// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion base, interface, final, sealed and mixin can only be applied to
/// classes and mixins in post-feature libraries.
///
/// @description Checks that it is a compile-time error if `base`, `interface`,
/// `final`, `sealed` or `mixin` modifiers are applied to classes or mixins in
/// pre-feature libraries.
/// @author sgrekhov22@gmail.com

// @dart=2.19

  base class BaseClass {}
//^^^^
// [analyzer] unspecified
// [cfe] unspecified

  interface class InterfaceClass {}
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final class FinalClass {}
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  sealed class SealedClass {}
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  abstract base class AbstractBaseClass {}
//         ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  abstract interface class AbstractInterfaceClass {}
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  abstract final class AbstractFinalClass {}
//         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  mixin class MixinClass {}
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  base mixin class BaseMixinClass {}
//^^^^
// [analyzer] unspecified
// [cfe] unspecified

  abstract mixin class AbstractMixinClass {}
//         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  abstract base mixin class AbstractBaseMixinClass {}
//         ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  base mixin BaseMixin {}
//^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(BaseClass);
  print(InterfaceClass);
  print(FinalClass);
  print(SealedClass);
  print(AbstractBaseClass);
  print(AbstractInterfaceClass);
  print(AbstractFinalClass);
  print(MixinClass);
  print(BaseMixinClass);
  print(AbstractMixinClass);
  print(AbstractBaseMixinClass);
  print(BaseMixin);
}
