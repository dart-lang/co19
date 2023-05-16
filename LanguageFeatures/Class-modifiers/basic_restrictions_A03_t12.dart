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
/// interface of a class marked `abstract base` outside of the library where it
/// is declared. Test type aliases
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

class ImplementsBaseClass implements TypedefAbstractBaseClass {}
//                                   ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseImplementsBaseClass implements TypedefAbstractBaseClass {}
//                                            ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceImplementsBaseClass implements TypedefAbstractBaseClass {}
//                                                      ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalImplementsBaseClass implements TypedefAbstractBaseClass {}
//                                              ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedImplementsBaseClass implements TypedefAbstractBaseClass {}
//                                                ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractImplementsBaseClass implements TypedefAbstractBaseClass {}
//                                                    ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseImplementsBaseClass implements TypedefAbstractBaseClass {}
//                                                             ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceImplementsBaseClass implements TypedefAbstractBaseClass {}
//                                                                       ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalImplementsBaseClass implements TypedefAbstractBaseClass {}
//                                                               ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassImplementsBaseClass implements TypedefAbstractBaseClass {}
//                                                   ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin class BaseMixinClassImplementsBaseClass implements TypedefAbstractBaseClass {}
//                                                            ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassImplementsBaseClass implements TypedefAbstractBaseClass {}
//                                                                    ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base mixin class AbstractBaseMixinClassImplementsBaseClass implements TypedefAbstractBaseClass {}
//                                                                             ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsBaseClass implements TypedefAbstractBaseClass {}
//                                        ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin BaseMixinImplementsBaseClass implements TypedefAbstractBaseClass {}
//                                                 ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumImplementsBaseClass implements TypedefAbstractBaseClass {e1, e2}
//                                      ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef LocalTypedefAbstractBaseClass = AbstractBaseClass;

base class BaseImplementsLocalTypedefAbstractBaseClass implements LocalTypedefAbstractBaseClass {}
//                                                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ImplementsBaseClass);
  print(BaseImplementsBaseClass);
  print(InterfaceImplementsBaseClass);
  print(FinalImplementsBaseClass);
  print(SealedImplementsBaseClass);
  print(AbstractImplementsBaseClass);
  print(AbstractBaseImplementsBaseClass);
  print(AbstractInterfaceImplementsBaseClass);
  print(AbstractFinalImplementsBaseClass);
  print(MixinClassImplementsBaseClass);
  print(BaseMixinClassImplementsBaseClass);
  print(AbstractMixinClassImplementsBaseClass);
  print(AbstractBaseMixinClassImplementsBaseClass);
  print(MixinImplementsBaseClass);
  print(BaseMixinImplementsBaseClass);
  print(EnumImplementsBaseClass);
  print(BaseImplementsLocalTypedefAbstractBaseClass);
}
