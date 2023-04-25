// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract base mixin class can be extended and mixed in but not
/// constructed, implemented and is not exhaustive
///
/// @description Checks that it is a compile-time error to implement a
/// `abstract base mixin class` outside of the library where it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

class ClassImplementsAbstractBaseMixinClass implements AbstractBaseMixinClass {}
//                                                     ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClassImplementsAbstractBaseMixinClass implements AbstractBaseMixinClass {}
//                                                              ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassImplementsAbstractBaseMixinClass implements AbstractBaseMixinClass {}
//                                                                        ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassImplementsAbstractBaseMixinClass implements AbstractBaseMixinClass {}
//                                                                ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassImplementsAbstractBaseMixinClass implements AbstractBaseMixinClass {}
//                                                                  ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassImplementsAbstractBaseMixinClass implements AbstractBaseMixinClass {}
//                                                                      ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassImplementsAbstractBaseMixinClass implements AbstractBaseMixinClass {}
//                                                                               ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassImplementsAbstractBaseMixinClass implements AbstractBaseMixinClass {}
//                                                                                         ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassImplementsAbstractBaseMixinClass implements AbstractBaseMixinClass {}
//                                                                                 ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassImplementsAbstractBaseMixinClass implements AbstractBaseMixinClass {}
//                                                                ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin class BaseMixinClassImplementsAbstractBaseMixinClass implements AbstractBaseMixinClass {}
//                                                                         ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassImplementsAbstractBaseMixinClass implements AbstractBaseMixinClass {}
//                                                                                 ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base mixin class AbstractBaseMixinClassImplementsAbstractBaseMixinClass implements AbstractBaseMixinClass {}
//                                                                                          ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsAbstractBaseMixinClass implements AbstractBaseMixinClass {}
//                                                     ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin BaseMixinImplementsAbstractBaseMixinClass implements AbstractBaseMixinClass {}
//                                                              ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumImplementsAbstractBaseMixinClass implements AbstractBaseMixinClass { e1, e2 }
//                                                   ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ClassImplementsAbstractBaseMixinClass);
  print(BaseClassImplementsAbstractBaseMixinClass);
  print(InterfaceClassImplementsAbstractBaseMixinClass);
  print(FinalClassImplementsAbstractBaseMixinClass);
  print(SealedClassImplementsAbstractBaseMixinClass);
  print(AbstractClassImplementsAbstractBaseMixinClass);
  print(AbstractBaseClassImplementsAbstractBaseMixinClass);
  print(AbstractInterfaceClassImplementsAbstractBaseMixinClass);
  print(AbstractFinalClassImplementsAbstractBaseMixinClass);
  print(MixinClassImplementsAbstractBaseMixinClass);
  print(BaseMixinClassImplementsAbstractBaseMixinClass);
  print(AbstractMixinClassImplementsAbstractBaseMixinClass);
  print(AbstractBaseMixinClassImplementsAbstractBaseMixinClass);
  print(MixinImplementsAbstractBaseMixinClass);
  print(BaseMixinImplementsAbstractBaseMixinClass);
  print(EnumImplementsAbstractBaseMixinClass);
}
