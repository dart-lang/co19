// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Base mixin can be mixed in but not constructed, extended or
/// implemented and is not exhaustive
///
/// @description Checks that it is a compile-time error to implement a
/// `base mixin` outside of the library where it is defined
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

class ImplementsBaseMixin implements BaseMixin {}
//                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseImplementsBaseMixin implements BaseMixin {}
//                                            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceImplementsBaseMixin implements BaseMixin {}
//                                                      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalImplementsBaseMixin implements BaseMixin {}
//                                              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedImplementsBaseMixin implements BaseMixin {}
//                                                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractImplementsBaseMixin implements BaseMixin {}
//                                                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseImplementsBaseMixin implements BaseMixin {}
//                                                             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceImplementsBaseMixin implements BaseMixin {}
//                                                                       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalImplementsBaseMixin implements BaseMixin {}
//                                                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassImplementsBaseMixin implements BaseMixin {}
//                                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin class BaseMixinClassImplementsBaseMixin implements BaseMixin {}
//                                                            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassImplementsBaseMixin implements BaseMixin {}
//                                                                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base mixin class AbstractBaseMixinClassImplementsBaseMixin implements BaseMixin {}
//                                                                             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsBaseMixin implements BaseMixin {}
//                                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin BaseMixinImplementsBaseMixin implements BaseMixin {}
//                                                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumImplementsBaseMixin implements BaseMixin {e1, e2}
//                                      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ImplementsBaseMixin);
  print(BaseImplementsBaseMixin);
  print(InterfaceImplementsBaseMixin);
  print(FinalImplementsBaseMixin);
  print(SealedImplementsBaseMixin);
  print(AbstractImplementsBaseMixin);
  print(AbstractBaseImplementsBaseMixin);
  print(AbstractInterfaceImplementsBaseMixin);
  print(AbstractFinalImplementsBaseMixin);
  print(MixinClassImplementsBaseMixin);
  print(BaseMixinClassImplementsBaseMixin);
  print(AbstractMixinClassImplementsBaseMixin);
  print(AbstractBaseMixinClassImplementsBaseMixin);
  print(MixinImplementsBaseMixin);
  print(BaseMixinImplementsBaseMixin);
  print(EnumImplementsBaseMixin);
}
