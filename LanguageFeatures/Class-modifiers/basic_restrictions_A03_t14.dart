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
/// interface of a class marked `abstract final` outside of the library where it
/// is declared. Test type aliases
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

class ImplementsFinalClass implements TypedefAbstractFinalClass {}
//                                    ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseImplementsFinalClass implements TypedefAbstractFinalClass {}
//                                             ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceImplementsFinalClass implements TypedefAbstractFinalClass {}
//                                                       ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalImplementsFinalClass implements TypedefAbstractFinalClass {}
//                                               ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedImplementsFinalClass implements TypedefAbstractFinalClass {}
//                                                 ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractImplementsFinalClass implements TypedefAbstractFinalClass {}
//                                                     ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseImplementsFinalClass implements TypedefAbstractFinalClass {}
//                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceImplementsFinalClass implements TypedefAbstractFinalClass {}
//                                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalImplementsFinalClass implements TypedefAbstractFinalClass {}
//                                                                ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassImplementsFinalClass implements TypedefAbstractFinalClass {}
//                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin class BaseMixinClassImplementsFinalClass implements TypedefAbstractFinalClass {}
//                                                             ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassImplementsFinalClass implements TypedefAbstractFinalClass {}
//                                                                     ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base mixin class AbstractBaseMixinClassImplementsFinalClass implements TypedefAbstractFinalClass {}
//                                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsFinalClass implements TypedefAbstractFinalClass {}
//                                         ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin BaseMixinImplementsFinalClass implements TypedefAbstractFinalClass {}
//                                                  ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumImplementsFinalClass implements TypedefAbstractFinalClass {e1, e2}
//                                       ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef LocalTypedefAbstractFinalClass = AbstractFinalClass;

final class FinalImplementsLocalTypedefAbstractFinalClass implements LocalTypedefAbstractFinalClass {}
//                                                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ImplementsFinalClass);
  print(BaseImplementsFinalClass);
  print(InterfaceImplementsFinalClass);
  print(FinalImplementsFinalClass);
  print(SealedImplementsFinalClass);
  print(AbstractImplementsFinalClass);
  print(AbstractBaseImplementsFinalClass);
  print(AbstractInterfaceImplementsFinalClass);
  print(AbstractFinalImplementsFinalClass);
  print(MixinClassImplementsFinalClass);
  print(BaseMixinClassImplementsFinalClass);
  print(AbstractMixinClassImplementsFinalClass);
  print(AbstractBaseMixinClassImplementsFinalClass);
  print(MixinImplementsFinalClass);
  print(BaseMixinImplementsFinalClass);
  print(EnumImplementsFinalClass);
  print(FinalImplementsLocalTypedefAbstractFinalClass);
}
