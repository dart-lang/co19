// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract final class cannot be constructed, extended, implemented
/// or mixed in and is not exhaustive
///
/// @description Checks that it is a compile-time error to implement
/// `abstract final class` outside of the library where it is defined
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

class ImplementsAbstractFinalClass implements AbstractFinalClass {}
//                                            ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseImplementsAbstractFinalClass implements AbstractFinalClass {}
//                                                     ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceImplementsAbstractFinalClass implements AbstractFinalClass {}
//                                                               ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalImplementsAbstractFinalClass implements AbstractFinalClass {}
//                                                       ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedImplementsAbstractFinalClass implements AbstractFinalClass {}
//                                                         ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractImplementsAbstractFinalClass implements AbstractFinalClass {}
//                                                             ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseImplementsAbstractFinalClass implements AbstractFinalClass {}
//                                                                      ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceImplementsAbstractFinalClass implements AbstractFinalClass {}
//                                                                                ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalImplementsAbstractFinalClass implements AbstractFinalClass {}
//                                                                        ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassImplementsAbstractFinalClass implements AbstractFinalClass {}
//                                                            ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin class BaseMixinClassImplementsAbstractFinalClass implements AbstractFinalClass {}
//                                                                     ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassImplementsAbstractFinalClass implements AbstractFinalClass {}
//                                                                             ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base mixin class AbstractBaseMixinClassImplementsAbstractFinalClass implements AbstractFinalClass {}
//                                                                                      ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsAbstractFinalClass implements AbstractFinalClass {}
//                                                 ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin BaseMixinImplementsAbstractFinalClass implements AbstractFinalClass {}
//                                                          ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumImplementsAbstractFinalClass implements AbstractFinalClass {e1, e2}
//                                               ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ImplementsAbstractFinalClass);
  print(BaseImplementsAbstractFinalClass);
  print(InterfaceImplementsAbstractFinalClass);
  print(FinalImplementsAbstractFinalClass);
  print(SealedImplementsAbstractFinalClass);
  print(AbstractImplementsAbstractFinalClass);
  print(AbstractBaseImplementsAbstractFinalClass);
  print(AbstractInterfaceImplementsAbstractFinalClass);
  print(AbstractFinalImplementsAbstractFinalClass);
  print(MixinClassImplementsAbstractFinalClass);
  print(BaseMixinClassImplementsAbstractFinalClass);
  print(AbstractMixinClassImplementsAbstractFinalClass);
  print(AbstractBaseMixinClassImplementsAbstractFinalClass);
  print(MixinImplementsAbstractFinalClass);
  print(BaseMixinImplementsAbstractFinalClass);
  print(EnumImplementsAbstractFinalClass);
}
