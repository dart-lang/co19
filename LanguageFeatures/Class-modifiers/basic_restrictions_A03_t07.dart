// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A declaration implements another declaration, and the other declaration
///   itself, or any of its super-declarations, are marked base or final and are
///   not from the first declaration's library
///
/// @description Check that it is a compile-time error to implement the
/// interface of a mixin class marked `base` outside of the library where it is
/// declared. Test `abstract base mixin class`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

class ImplementsBaseMixinClass implements AbstractBaseMixinClass {}
//                                        ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseImplementsBaseMixinClass implements AbstractBaseMixinClass {}
//                                                 ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceImplementsBaseMixinClass implements AbstractBaseMixinClass {}
//                                                           ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalImplementsBaseMixinClass implements AbstractBaseMixinClass {}
//                                                   ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedImplementsBaseMixinClass implements AbstractBaseMixinClass {}
//                                                     ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractImplementsBaseMixinClass implements AbstractBaseMixinClass {}
//                                                         ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseImplementsBaseMixinClass implements AbstractBaseMixinClass {}
//                                                                  ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceImplementsBaseMixinClass implements AbstractBaseMixinClass {}
//                                                                            ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalImplementsBaseMixinClass implements AbstractBaseMixinClass {}
//                                                                    ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassImplementsBaseMixinClass implements AbstractBaseMixinClass {}
//                                                        ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin class BaseMixinClassImplementsBaseMixinClass implements AbstractBaseMixinClass {}
//                                                                 ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassImplementsBaseMixinClass implements AbstractBaseMixinClass {}
//                                                                         ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base mixin class AbstractBaseMixinClassImplementsBaseMixinClass implements AbstractBaseMixinClass {}
//                                                                                  ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsBaseMixinClass implements AbstractBaseMixinClass {}
//                                             ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin BaseMixinImplementsBaseMixinClass implements AbstractBaseMixinClass {}
//                                                      ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumImplementsBaseMixinClass implements AbstractBaseMixinClass {e1, e2}
//                                           ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ImplementsBaseMixinClass);
  print(BaseImplementsBaseMixinClass);
  print(InterfaceImplementsBaseMixinClass);
  print(FinalImplementsBaseMixinClass);
  print(SealedImplementsBaseMixinClass);
  print(AbstractImplementsBaseMixinClass);
  print(AbstractBaseImplementsBaseMixinClass);
  print(AbstractInterfaceImplementsBaseMixinClass);
  print(AbstractFinalImplementsBaseMixinClass);
  print(MixinClassImplementsBaseMixinClass);
  print(BaseMixinClassImplementsBaseMixinClass);
  print(AbstractMixinClassImplementsBaseMixinClass);
  print(AbstractBaseMixinClassImplementsBaseMixinClass);
  print(MixinImplementsBaseMixinClass);
  print(BaseMixinImplementsBaseMixinClass);
  print(EnumImplementsBaseMixinClass);
}
