// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An enum declaration still cannot be implemented, extended or
/// mixed in anywhere, independently of modifiers.
///
/// @description Check that it is a compile-time error if an enum declaration is
/// mixed in
/// @author sgrekhov22@gmail.com

enum E {e1, e2}

class WithEnum with E {}
//                  ^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseWithEnum with E {}
//                           ^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceWithEnum with E {}
//                                     ^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalWithEnum with E {}
//                             ^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedWithEnum with E {}
//                               ^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractWithEnum with E {}
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseWithEnum with E {}
//                                            ^
// [analyzer] unspecified
// [cfe] unspecified


abstract interface class AbstractInterfaceWithEnum with E {}
//                                                      ^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalWithEnum with E {}
//                                              ^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassWithEnum with E {}
//                                  ^
// [analyzer] unspecified
// [cfe] unspecified

base mixin class BaseMixinClassWithEnum with E {}
//                                           ^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassWithEnum with E {}
//                                                   ^
// [analyzer] unspecified
// [cfe] unspecified

abstract base mixin class AbstractBaseMixinClassWithEnum with E {}
//                                                            ^
// [analyzer] unspecified
// [cfe] unspecified

typedef TypedefE = E;

class WithTypedefEnum with TypedefE {}
//                         ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(WithEnum);
  print(BaseWithEnum);
  print(InterfaceWithEnum);
  print(FinalWithEnum);
  print(SealedWithEnum);
  print(AbstractWithEnum);
  print(AbstractBaseWithEnum);
  print(AbstractInterfaceWithEnum);
  print(AbstractFinalWithEnum);
  print(MixinClassWithEnum);
  print(BaseMixinClassWithEnum);
  print(AbstractMixinClassWithEnum);
  print(AbstractBaseMixinClassWithEnum);
  print(WithTypedefEnum);
}
