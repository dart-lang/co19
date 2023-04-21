// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Base mixin class can be constructed, extended and mixed in but
/// not implemented and is not exhaustive
///
/// @description Checks that it is a compile-time error to implement a
/// `base mixin class` outside of the library where it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

class ClassImplementsBaseMixinClass implements BaseMixinClass {}
//                                             ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClassImplementsBaseMixinClass implements BaseMixinClass {}
//                                                      ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassImplementsBaseMixinClass implements BaseMixinClass {}
//                                                                ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassImplementsBaseMixinClass implements BaseMixinClass {}
//                                                        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassImplementsBaseMixinClass implements BaseMixinClass {}
//                                                          ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassImplementsBaseMixinClass implements BaseMixinClass {}
//                                                              ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassImplementsBaseMixinClass implements BaseMixinClass {}
//                                                                       ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassImplementsBaseMixinClass implements BaseMixinClass {}
//                                                                                 ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassImplementsBaseMixinClass implements BaseMixinClass {}
//                                                                         ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassImplementsBaseMixinClass implements BaseMixinClass {}
//                                                        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin class BaseMixinClassImplementsBaseMixinClass implements BaseMixinClass {}
//                                                                 ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassImplementsBaseMixinClass implements BaseMixinClass {}
//                                                                         ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base mixin class AbstractBaseMixinClassImplementsBaseMixinClass implements BaseMixinClass {}
//                                                                                  ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsBaseMixinClass implements BaseMixinClass {}
//                                             ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin BaseMixinImplementsBaseMixinClass implements BaseMixinClass {}
//                                                      ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumImplementsBaseMixinClass implements BaseMixinClass { e1, e2 }
//                                           ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ClassImplementsBaseMixinClass);
  print(BaseClassImplementsBaseMixinClass);
  print(InterfaceClassImplementsBaseMixinClass);
  print(FinalClassImplementsBaseMixinClass);
  print(SealedClassImplementsBaseMixinClass);
  print(AbstractClassImplementsBaseMixinClass);
  print(AbstractBaseClassImplementsBaseMixinClass);
  print(AbstractInterfaceClassImplementsBaseMixinClass);
  print(AbstractFinalClassImplementsBaseMixinClass);
  print(MixinClassImplementsBaseMixinClass);
  print(BaseMixinClassImplementsBaseMixinClass);
  print(AbstractMixinClassImplementsBaseMixinClass);
  print(AbstractBaseMixinClassImplementsBaseMixinClass);
  print(MixinImplementsBaseMixinClass);
  print(BaseMixinImplementsBaseMixinClass);
  print(EnumImplementsBaseMixinClass);
}
