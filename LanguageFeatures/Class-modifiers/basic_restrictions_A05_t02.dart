// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An enum declaration still cannot be implemented, extended or
/// mixed in anywhere, independently of modifiers.
///
/// @description Check that it is a compile-time error if an enum declaration is
/// implemented
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

enum E {e1, e2}

class ImplementsEnum implements E {}
//                              ^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseImplementsEnum implements E {}
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceImplementsEnum implements E {}
//                                                 ^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalImplementsEnum implements E {}
//                                         ^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedImplementsEnum implements E {}
//                                           ^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractImplementsEnum implements E {}
//                                               ^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseImplementsEnum implements E {}
//                                                        ^
// [analyzer] unspecified
// [cfe] unspecified


abstract interface class AbstractInterfaceImplementsEnum implements E {}
//                                                                  ^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalImplementsEnum implements E {}
//                                                          ^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassImplementsEnum implements E {}
//                                              ^
// [analyzer] unspecified
// [cfe] unspecified

base mixin class BaseMixinClassImplementsEnum implements E {}
//                                                       ^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassImplementsEnum implements E {}
//                                                               ^
// [analyzer] unspecified
// [cfe] unspecified

abstract base mixin class AbstractBaseMixinClassImplementsEnum implements E {}
//                                                                        ^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsEnum implements E {}
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified

base mixin BaseMixinImplementsEnum implements E {}
//                                            ^
// [analyzer] unspecified
// [cfe] unspecified

typedef TypedefE = E;

class ImplementsTypedefEnum implements TypedefE {}
//                                     ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ImplementsEnum);
  print(BaseImplementsEnum);
  print(InterfaceImplementsEnum);
  print(FinalImplementsEnum);
  print(SealedImplementsEnum);
  print(AbstractImplementsEnum);
  print(AbstractBaseImplementsEnum);
  print(AbstractInterfaceImplementsEnum);
  print(AbstractFinalImplementsEnum);
  print(MixinClassImplementsEnum);
  print(BaseMixinClassImplementsEnum);
  print(AbstractMixinClassImplementsEnum);
  print(AbstractBaseMixinClassImplementsEnum);
  print(MixinImplementsEnum);
  print(BaseMixinImplementsEnum);
  print(ImplementsTypedefEnum);
}
