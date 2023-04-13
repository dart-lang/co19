// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An enum declaration still cannot be implemented, extended or
/// mixed in anywhere, independently of modifiers.
///
/// @description Check that it is a compile-time error if an enum declaration is
/// extended or used in mixin's `on` part
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

enum E {e1, e2}

class ExtendsEnum extends E {}
//                        ^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseExtendsEnum extends E {}
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceExtendsEnum extends E {}
//                                           ^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalExtendsEnum extends E {}
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedExtendsEnum extends E {}
//                                     ^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractExtendsEnum extends E {}
//                                         ^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseExtendsEnum extends E {}
//                                                  ^
// [analyzer] unspecified
// [cfe] unspecified


abstract interface class AbstractInterfaceExtendsEnum extends E {}
//                                                            ^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalExtendsEnum extends E {}
//                                                    ^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinOnEnum on E {}
//                   ^
// [analyzer] unspecified
// [cfe] unspecified

base mixin BaseMixinOnEnum on E {}
//                            ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ExtendsEnum);
  print(BaseExtendsEnum);
  print(InterfaceExtendsEnum);
  print(FinalExtendsEnum);
  print(SealedExtendsEnum);
  print(AbstractExtendsEnum);
  print(AbstractBaseExtendsEnum);
  print(AbstractInterfaceExtendsEnum);
  print(AbstractFinalExtendsEnum);
  print(MixinOnEnum);
  print(BaseMixinOnEnum);
}
